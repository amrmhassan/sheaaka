// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/signup_screen/widgets/back_step_form_button.dart';
import 'package:project/screens/signup_store_screen/widgets/cover_image.dart';
import 'package:project/screens/signup_store_screen/widgets/logo_image.dart';
import 'package:project/screens/signup_store_screen/widgets/upload_cover_photo_button.dart';
import 'package:project/screens/signup_store_screen/widgets/upload_message.dart';
import 'package:project/utils/photo_utils.dart';

//! add options to remove the photo on the choose photo modal
//! add option to add a photo from a link from modal modal

class SingUpStoreLogoUpload extends StatefulWidget {
  final VoidCallback incrementActiveIndex;
  final VoidCallback decrementActiveIndex;
  final String? storeLogoPhoto;
  final String? storeCoverPhoto;
  final Function(String? s) setStoreLogoPhoto;
  final Function(String? s) setStoreCoverPhoto;

  const SingUpStoreLogoUpload({
    Key? key,
    required this.decrementActiveIndex,
    required this.incrementActiveIndex,
    required this.setStoreCoverPhoto,
    required this.setStoreLogoPhoto,
    required this.storeCoverPhoto,
    required this.storeLogoPhoto,
  }) : super(key: key);

  @override
  State<SingUpStoreLogoUpload> createState() => _SingUpStoreLogoUploadState();
}

class _SingUpStoreLogoUploadState extends State<SingUpStoreLogoUpload> {
  //? logo loading
  bool logoLoading = false;
  void startLogoLoading() {
    setState(() {
      logoLoading = true;
    });
  }

  void endLogoLoading() {
    setState(() {
      logoLoading = false;
    });
  }

//? cover loading
  bool coverLoading = false;
  void startCoverLoading() {
    setState(() {
      coverLoading = true;
    });
  }

  void endCoverLoading() {
    setState(() {
      coverLoading = false;
    });
  }

//? for handling picking logo image
  void handlePickLogoImage(ImageSource imageSource) => pickImage(
        context: context,
        callBack: widget.setStoreLogoPhoto,
        source: imageSource,
        setStartLoading: startLogoLoading,
        setEndLoading: endLogoLoading,
        cloudFolderName: storeLogoImagesDir,
      );
//? for handling picking cover image
  void handlePickCoverImage(ImageSource imageSource) => pickImage(
        context: context,
        callBack: widget.setStoreCoverPhoto,
        source: imageSource,
        setStartLoading: startCoverLoading,
        setEndLoading: endCoverLoading,
        cloudFolderName: storeLogoImagesDir,
      );

//? choosing logo image, modal
  void showLogoImageModalHelper() {
    showPickImageOptions(context, handlePickLogoImage, 'اختيار صورة اللوجو');
  }

//? choosing cover image, modal
  void showCoverImageModalHelper() {
    showPickImageOptions(context, handlePickCoverImage, 'اختيار صورة الغلاف');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: showCoverImageModalHelper,
              child: CoverImage(
                  coverLoading: coverLoading,
                  storeCoverPhoto: widget.storeCoverPhoto),
            ),
            if (coverLoading) CircularProgressIndicator(),
            Positioned(
              bottom: -50,
              right: largePadding,
              child: GestureDetector(
                onTap: showLogoImageModalHelper,
                child: LogoImage(
                  logoLoading: logoLoading,
                  storeLogoPhoto: widget.storeLogoPhoto,
                ),
              ),
            ),
            if (!coverLoading && widget.storeCoverPhoto == null)
              UploadCoverPhotoButton(
                logoLoading: logoLoading,
                showCoverImageModalHelper: showCoverImageModalHelper,
              )
          ],
        ),
        VSpace(factor: 5),
        UploadMessage(
          storeCoverPhoto: widget.storeCoverPhoto,
          storeLogoPhoto: widget.storeLogoPhoto,
        ),
        VSpace(factor: 5),
        SubmitFormButton(
            onTap: widget.incrementActiveIndex,
            title: (widget.storeCoverPhoto == null) &&
                    (widget.storeLogoPhoto == null)
                ? 'تخطي'
                : 'التالي'),
        BackStepFormButton(onTap: widget.decrementActiveIndex),
      ],
    );
  }
}
