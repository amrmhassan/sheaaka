// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/add_product_photo_button.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/product_image_uploaded.dart';
import 'package:project/utils/photo_utils.dart';

class ProductImages extends StatelessWidget {
  final List<File> imagesPaths;
  final Function(File imageFile) addProductImage;
  final Function(File path) removeProductImage;

  const ProductImages({
    Key? key,
    required this.imagesPaths,
    required this.addProductImage,
    required this.removeProductImage,
  }) : super(key: key);

//? to pick image from the source
  Future<void> pickImage(BuildContext context, ImageSource source) async {
    File? imageFile = await getImageReadyToUploadFile(
      finalQuality: 50,
      initialQuality: 20,
      maxSize: 5000,
      source: source,
      context: context,
      cropAspectRatio: CropAspectRatio(ratioX: 9, ratioY: 16),
    );
    if (imageFile != null) {
      addProductImage(imageFile);
    }
  }

  void handlePickOptions(BuildContext context) {
    showPickImageOptions(
      context,
      (source) => pickImage(context, source),
      'من فضلك اختر الصورة',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaddingWrapper(child: Text('إضافة صور للمنتج')),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HSpace(),
              ...imagesPaths.map(
                (e) {
                  return ProductImageUploaded(
                    imageFile: e,
                    removeImageFile: removeProductImage,
                  );
                },
              ),
              if (imagesPaths.length <= 3)
                AddProductPhotoButton(
                  onTap: () => handlePickOptions(context),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
