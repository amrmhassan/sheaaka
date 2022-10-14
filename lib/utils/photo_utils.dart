//? to pick an image
// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, depend_on_referenced_packages

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project/constants/photo_constants.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/signup_screen/widgets/image_picking_option_element.dart';
import 'package:project/utils/general_utils.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

//? for picking an image then upload it to the fire storage
Future<void> pickImage({
  required BuildContext context,
  required ImageSource source,
  required Function(String? uploadedImagePath) callBack,
  required VoidCallback setStartLoading,
  required VoidCallback setEndLoading,
  required String cloudFolderName,
  CropAspectRatio? cropAspectRatio,
  int? initialQuality,
  int? maxSize,
  int? finalQuality,
}) async {
  Navigator.pop(context);

  try {
    File? compressedFile = await getImageReadyToUploadFile(
      context: context,
      source: source,
      cropAspectRatio: cropAspectRatio,
      finalQuality: finalQuality,
      initialQuality: initialQuality,
      maxSize: maxSize,
    );
    if (compressedFile == null) return;
    String? profilePhotoUrl = await uploadFile(
      context: context,
      path: compressedFile.path,
      setEndLoading: setEndLoading,
      setStartLoading: setStartLoading,
      cloudFolderName: cloudFolderName,
    );
    callBack(profilePhotoUrl);
  } catch (e) {
    showSnackBar(
        context: context,
        message: kDebugMode ? e.toString() : 'حدث خطأ',
        snackBarType: SnackBarType.error);
  }
}

//? to pick an image and return it's file
Future<File?> getImageReadyToUploadFile({
  required ImageSource source,
  required BuildContext context,
  CropAspectRatio? cropAspectRatio,
  int? initialQuality,
  int? maxSize,
  int? finalQuality,
}) async {
  ImagePicker picker = ImagePicker();
  XFile? image =
      await picker.pickImage(source: source, imageQuality: initialQuality ?? 5);
  if (image == null) return null;
  var file = await ImageCropper.platform.cropImage(
    sourcePath: image.path,
    aspectRatio: cropAspectRatio ?? CropAspectRatio(ratioX: 1, ratioY: 1),
  );
  double imageSize =
      (await image.length()) / 1000; // this will return the image size in kb
  if (imageSize > (maxSize ?? maxAfterPickSize)) {
    String msg = 'لا يمكن أن يتعدي حجم الصورة ${maxAfterPickSize / 1000} ميجا';
    showSnackBar(
        context: context, message: msg, snackBarType: SnackBarType.error);
    return null;
  }
  int quality = 500 ~/ imageSize;
  quality = quality > maxCompressQuality ? maxCompressQuality : quality;
  if (file == null) return null;
  File? compressedFile =
      await compressImage(file.path, finalQuality ?? quality);
  return compressedFile;
}

//? to compress an image
Future<File?> compressImage(String path, int quality) async {
  //* when ever the q
  final newPath = p.join((await getTemporaryDirectory()).path,
      '${Uuid().v4()}${p.extension(path)}');

  final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
      quality: quality);
  return result;
}

//? for uploading a file to firebase storage
Future<String?> uploadFile({
  required BuildContext context,
  required String path,
  required VoidCallback setStartLoading,
  required VoidCallback setEndLoading,
  required String cloudFolderName,
}) async {
  String? fileUrl;
  setStartLoading();
  try {
    final ref = FirebaseStorage.instance
        .ref()
        .child(cloudFolderName)
        .child('${Uuid().v4()}-${DateTime.now()}.${p.basename(path)}');

    final result = await ref.putFile(File(path));
    fileUrl = await result.ref.getDownloadURL();
  } catch (e) {
    showSnackBar(
        context: context,
        message: kDebugMode
            ? 'upload error ${e.toString()}'
            : 'حدث خطأ في رفع الصورة',
        snackBarType: SnackBarType.error);
  }
  setEndLoading();

  return fileUrl;
}

//? to view the bottom modal to choose the image source
void showPickImageOptions(
  BuildContext context,
  Function(ImageSource imageSource) handlePickImage, [
  String? title,
]) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ModalWrapper(
          onApply: () {},
          applyButtonTitle: 'applyButtonTitle',
          showApplyModalButton: false,
          afterLinePaddingFactor: title != null ? .5 : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: double.infinity),
              if (title != null)
                Column(
                  children: [
                    Text(
                      title,
                      style: h3LiteTextStyle,
                    ),
                    VSpace()
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImagePickingOptionElement(
                    iconName: 'camera1',
                    onTap: () {
                      handlePickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                  HSpace(factor: .5),
                  ImagePickingOptionElement(
                    iconName: 'gallery',
                    onTap: () {
                      handlePickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
