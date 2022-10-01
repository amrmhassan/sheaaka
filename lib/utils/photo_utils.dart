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
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/photo_constants.dart';
import 'package:project/models/types.dart';
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
}) async {
  Navigator.pop(context);

  try {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source, imageQuality: 5);
    if (image == null) return;
    var file = await ImageCropper.platform.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    double imageSize =
        (await image.length()) / 1000; // this will return the image size in kb
    if (imageSize > maxAfterPickSize) {
      String msg =
          'لا يمكن أن يتعدي حجم الصورة ${maxAfterPickSize / 1000} ميجا';
      return showSnackBar(context, msg, SnackBarType.error);
    }
    int quality = 500 ~/ imageSize;
    quality = quality > maxCompressQuality ? maxCompressQuality : quality;
    if (file == null) return;
    File? compressedFile = await compressImage(file.path, quality);
    if (compressedFile == null) return;
    String? profilePhotoUrl = await _uploadFile(
      context: context,
      path: compressedFile.path,
      setEndLoading: setEndLoading,
      setStartLoading: setStartLoading,
      cloudFolderName: cloudFolderName,
    );
    callBack(profilePhotoUrl);
  } catch (e) {
    showSnackBar(
        context, kDebugMode ? e.toString() : 'حدث خطأ', SnackBarType.error);
  }
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
Future<String?> _uploadFile({
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
        context,
        kDebugMode ? 'upload error ${e.toString()}' : 'حدث خطأ في رفع الصورة',
        SnackBarType.error);
  }
  setEndLoading();

  return fileUrl;
}
