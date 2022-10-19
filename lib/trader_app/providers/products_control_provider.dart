// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/utils/general_utils.dart';
import 'package:project/utils/photo_utils.dart';
import 'package:uuid/uuid.dart';

class ProductsControlProvider extends ChangeNotifier {
  //? uploading images
  bool uploadingImages = false;
  void setUploadingImages(bool b) {
    uploadingImages = b;
    notifyListeners();
  }

  //? uploading product data
  bool uploadingProductData = false;
  void setUploadingProductData(bool b) {
    uploadingProductData = b;
    notifyListeners();
  }

  //? to any loading
  bool get loading {
    return uploadingImages || uploadingProductData;
  }

  //? upload product
  Future<void> uploadProduct({
    required TextEditingController nameController,
    required StoreModel myStore,
    required List<File> imagesFiles,
    required TextEditingController currentPriceController,
    required List<Color> availableColors,
    required List<Sizes> availableSizes,
    required TextEditingController brandNameController,
    required TextEditingController shortDescController,
    required TextEditingController oldPriceController,
    required BuildContext context,
    required String fullDesc,
    required DateTime? offerEnd,
    required bool isOffer,
    required ProductsProvider productsProvider,
    required TextEditingController offerNameController,
    required TextEditingController keywordksController,
    //! add the offer to the local state
    required StoreProvider storeProvider,
  }) async {
    //* uploading images
    List<String> imagesLinks = await uploadImages(
      context: context,
      files: imagesFiles,
      storeId: myStore.id,
    );

    setUploadingProductData(true);

    //* uploading product data
    String productId = Uuid().v4();
    String fullDescText = fullDesc.replaceAll('\n\n', '\n');
    String keywordsString = keywordksController.text;
    List<String> keywords = keywordsString.split('\n');

    ProductModel productModel = ProductModel(
      id: productId,
      name: nameController.text,
      storeId: myStore.id,
      storeName: myStore.name,
      imagesPath: imagesLinks,
      createdAt: DateTime.now(),
      lovesNumber: 0,
      price: double.parse(currentPriceController.text),
      availableColors: availableColors,
      availableSize: availableSizes,
      brand: BrandModel(name: brandNameController.text, id: Uuid().v4()),
      shortDesc: shortDescController.text,
      oldPrice: double.tryParse(oldPriceController.text),
      storeLogo: myStore.logoImagePath,
      fullDesc: fullDescText,
      keywords: keywords,
    );
    await FirebaseFirestore.instance
        .collection(productsCollectionName)
        .doc(productId)
        .set(productModel.toJSON());

    //* checking if product has offer, then upload it
    if (isOffer) {
      double currentPrice = double.parse(currentPriceController.text);
      double oldPirce = double.parse(oldPriceController.text);
      double discountPercentage = ((oldPirce - currentPrice) / oldPirce) * 100;

      await storeProvider.addOffer(
        discountPercentage: discountPercentage,
        endAt: offerEnd!,
        imagePath: imagesLinks[0],
        productId: productId,
        productName: nameController.text,
        storeId: myStore.id,
        title: offerNameController.text,
      );
    }
    productsProvider.addProduct(productModel);
    setUploadingProductData(false);
  }

  //? upload images
  Future<List<String>> uploadImages({
    required List<File> files,
    required String storeId,
    required BuildContext context,
  }) async {
    List<String> uploadedImagesLinks = [];
    setUploadingImages(true);
    for (var imageFile in files) {
      String? imageLink = await uploadFile(
        context: context,
        path: imageFile.path,
        setStartLoading: () {},
        setEndLoading: () {},
        cloudFolderName: '$productsImagesDir/$storeId',
      );
      if (imageLink != null) {
        uploadedImagesLinks.add(imageLink);
      }
    }

    setUploadingImages(false);
    return uploadedImagesLinks;
  }

//? editing a product
  Future<void> editProduct(
    ProductModel newProduct,
    ProductsProvider productsProvider,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection(productsCollectionName)
          .doc(newProduct.id)
          .update(newProduct.toJSON());
      productsProvider.editProduct(newProduct);
    } catch (e, s) {
      throw CustomError(
          errString: e.toString(),
          stackTrace: s,
          errorType: ErrorsTypes.errorEditingProduct);
    }
  }

  //? deleting product
  Future<void> deleteProduct(
    ProductModel p,
    StoreProvider storeProvider,
    ProductsProvider productsProvider,
  ) async {
    try {
      //* removing product data
      await FirebaseFirestore.instance
          .collection(productsCollectionName)
          .doc(p.id)
          .delete();
      //* removing product images
      for (var imagePath in p.imagesPath) {
        String path = getFileRefFromLink(imagePath);
        await FirebaseStorage.instance.ref(path).delete();
      }

      //* removing product from local state
      productsProvider.removeProduct(p.id);

      //* delete offers

      List<OfferModel> offers = storeProvider.offers
          .where((element) => element.productId == p.id)
          .toList();
      for (var offer in offers) {
        await storeProvider.deleteOffer(offer.id);
      }
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorRemovingProduct,
        stackTrace: s,
        errString: e.toString(),
      );
    }
  }
}
