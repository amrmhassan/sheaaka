// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/helpers/custom_error.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_add_product_screen/t_add_product_screen.dart';
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
    required List imagesFiles,
    required TextEditingController offerPriceController,
    required List<Color> availableColors,
    required List<Sizes> availableSizes,
    required TextEditingController brandNameController,
    required TextEditingController shortDescController,
    required TextEditingController originalPriceController,
    required BuildContext context,
    required String fullDesc,
    required DateTime? offerEnd,
    required bool isOffer,
    required ProductsProvider productsProvider,
    required TextEditingController offerNameController,
    required TextEditingController keywordksController,
    //! add the offer to the local state
    required StoreProvider storeProvider,
    required AddProductMode addProductMode,
    String? editedProductId,
    DateTime? editedProductCreatedAt,
    int? editedProductLovesNumber,
    String? editedProductBrandId,
  }) async {
    //* uploading images
    List<String> imagesLinks = await uploadImages(
      context: context,
      files: imagesFiles,
      storeId: myStore.id,
    );

    setUploadingProductData(true);

    //* uploading product data
    String productId =
        addProductMode == AddProductMode.edit ? editedProductId! : Uuid().v4();
    String fullDescText = fullDesc.replaceAll('\n\n', '\n');
    String keywordsString = keywordksController.text;
    List<String> keywords = keywordsString.split('\n');
    String offerId = Uuid().v4();

    if (addProductMode == AddProductMode.add) {
      //* adding a new product with offers and every thing
      ProductModel productModel = ProductModel(
        id: productId,
        name: nameController.text,
        storeId: myStore.id,
        storeName: myStore.name,
        imagesPath: imagesLinks,
        createdAt: DateTime.now(),
        lovesNumber: 0,
        price: double.parse(originalPriceController.text),
        availableColors: availableColors,
        availableSize: availableSizes,
        brand: BrandModel(name: brandNameController.text, id: Uuid().v4()),
        storeLogo: myStore.logoImagePath,
        shortDesc: shortDescController.text,
        fullDesc: fullDescText,
        keywords: keywords,
      );
      productModel.offerId = isOffer ? offerId : null;
      await FirebaseFirestore.instance
          .collection(productsCollectionName)
          .doc(productId)
          .set(productModel.toJSON());

      //* checking if product has offer, then upload it
      if (isOffer) {
        double currentPrice = double.parse(offerPriceController.text);
        double oldPirce = double.parse(originalPriceController.text);
        double discount = 1 - currentPrice / oldPirce;

        await storeProvider.addOffer(
          discountPercentage: discount,
          endAt: offerEnd!,
          imagePath: imagesLinks[0],
          productId: productId,
          productName: nameController.text,
          storeId: myStore.id,
          title: offerNameController.text,
          offerId: offerId,
        );
      }
      productsProvider.addProduct(productModel);
    } else {
      //* editing  a product
      ProductModel editedProductModel = ProductModel(
        id: productId,
        name: nameController.text,
        storeId: myStore.id,
        storeName: myStore.name,
        imagesPath: imagesLinks,
        createdAt: editedProductCreatedAt!,
        lovesNumber: editedProductLovesNumber!,
        price: double.parse(originalPriceController.text),
        shortDesc: shortDescController.text,
        fullDesc: fullDescText,
        keywords: keywords,
        brand: editedProductBrandId == null
            ? null
            : BrandModel(
                name: brandNameController.text,
                id: editedProductBrandId,
              ),
        availableColors: availableColors,
        availableSize: availableSizes,
        storeLogo: myStore.logoImagePath,
      );
      await FirebaseFirestore.instance
          .collection(productsCollectionName)
          .doc(productId)
          .update(editedProductModel.toJSON());
      productsProvider.editProduct(editedProductModel);
    }

    setUploadingProductData(false);
  }

  //? upload images
  Future<List<String>> uploadImages({
    required List files,
    required String storeId,
    required BuildContext context,
  }) async {
    //! here check if the image is a file or not , cause it will be either a file or a link of an already uploaded image, that will happen when editing a product
    List<String> uploadedImagesLinks = [];
    setUploadingImages(true);
    for (var imageFile in files) {
      if (imageFile is File) {
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
      } else {
        uploadedImagesLinks.add(imageFile);
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
          errString: e,
          stackTrace: s,
          errorType: ErrorsTypes.errorEditingProduct);
    }
  }

  //? deleting product
  Future<void> deleteProduct(
    ProductModel p,
    StoreProvider storeProvider,
    ProductsProvider productsProvider,
    TraderProvider traderProvider,
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

      if (p.offerId != null) {
        await storeProvider.deleteOffer(p.offerId!);
      }
      //* delete it from store tabs
      await traderProvider.removeProductFromTabs(p.id);
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorRemovingProduct,
        stackTrace: s,
        errString: e,
      );
    }
  }
}
