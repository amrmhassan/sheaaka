// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/photo_utils.dart';
import 'package:uuid/uuid.dart';

bool _sleepAlot = false;

class AddProductProvider extends ChangeNotifier {
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
  }) async {
    List<String> imagesLinks = await uploadImages(
      context: context,
      files: imagesFiles,
      storeId: myStore.id,
    );

    setUploadingProductData(true);

    String productId = Uuid().v4();
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
      fullDesc: fullDesc,
    );
    await FirebaseFirestore.instance
        .collection(productsCollectionName)
        .doc(productId)
        .set(productModel.toJSON());
    if (kDebugMode && _sleepAlot) {
      await Future.delayed(Duration(seconds: 30));
    }
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
    if (kDebugMode && _sleepAlot) {
      await Future.delayed(Duration(seconds: 30));
    }
    setUploadingImages(false);
    return uploadedImagesLinks;
  }
}