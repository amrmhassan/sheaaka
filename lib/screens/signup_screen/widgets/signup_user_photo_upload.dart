// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/signup_screen/widgets/back_step_form_button.dart';
import 'package:project/screens/signup_screen/widgets/image_picking_option_element.dart';
import 'package:path/path.dart' as p;
import 'package:project/utils/general_utils.dart';
import 'package:uuid/uuid.dart';

const maxCompressQuality = 10;
const maxAfterPickSize = 1000; // this is 1MB

//? if the user is a trader he can't add a personal photo
//? before adding the user photo the button will be تخطي
//? after adding the photo it will be التالي
class SignUpUserPhotoUpload extends StatefulWidget {
  final VoidCallback incrementActiveIndex;
  final VoidCallback decrementActiveIndex;
  final Function(String? p) setProfilePhoto;
  final String? profileImage;

  const SignUpUserPhotoUpload({
    Key? key,
    required this.incrementActiveIndex,
    required this.decrementActiveIndex,
    required this.setProfilePhoto,
    required this.profileImage,
  }) : super(key: key);

  @override
  State<SignUpUserPhotoUpload> createState() => _SignUpUserPhotoUploadState();
}

class _SignUpUserPhotoUploadState extends State<SignUpUserPhotoUpload> {
  bool _uploading = false;
//? to pick an image
  Future<void> pickImage(ImageSource source, BuildContext context) async {
    Navigator.pop(context);

    try {
      ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: source, imageQuality: 7);
      if (image == null) return;
      var file = await ImageCropper.platform.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      double imageSize = (await image.length()) /
          1000; // this will return the image size in kb
      if (imageSize > maxAfterPickSize) {
        String msg =
            'لا يمكن أن يتعدي حجم الصورة ${maxAfterPickSize / 1000} ميجا';
        return showSnackBar(context, msg, SnackBarType.error);
      }
      int quality = 1000 ~/ imageSize;
      quality = quality > maxCompressQuality ? maxCompressQuality : quality;
      if (file == null) return;
      File? compressedFile = await compressImage(file.path, quality);
      if (compressedFile == null) return;
      String? profilePhotoUrl = await _uploadFile(compressedFile.path);
      widget.setProfilePhoto(profilePhotoUrl);
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
  Future<String?> _uploadFile(String path) async {
    String? fileUrl;
    setState(() {
      _uploading = true;
    });
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child(profileImagesDir)
          .child('${Uuid().v4()}-${DateTime.now()}.${p.basename(path)}');

      final result = await ref.putFile(File(path));
      fileUrl = await result.ref.getDownloadURL();
    } catch (e) {
      showSnackBar(
          context,
          kDebugMode ? 'upload error ${e.toString()}' : 'حدث خطأ في رفع الصورة',
          SnackBarType.error);
    }

    setState(() {
      _uploading = false;
    });
    return fileUrl;
  }

//? to view the bottom modal to choose the image source
  void showPickImageOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return ModalWrapper(
            onApply: () {},
            applyButtonTitle: 'applyButtonTitle',
            showApplyModalButton: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePickingOptionElement(
                  iconName: 'camera1',
                  onTap: () => pickImage(ImageSource.camera, context),
                ),
                HSpace(factor: .5),
                ImagePickingOptionElement(
                  iconName: 'gallery',
                  onTap: () => pickImage(ImageSource.gallery, context),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
        ),
        VSpace(factor: 2),
        Text(
          'صورة المستخدم',
          style: h1TextStyle,
        ),
        VSpace(factor: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _uploading ? () {} : () => showPickImageOptions(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (widget.profileImage == null)
                    Container(
                      padding: EdgeInsets.all(smallPadding),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        border: Border.all(
                          width: 1,
                          color: kSecondaryColor,
                        ),
                      ),
                      child: Image.asset(
                        'assets/icons/profile.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  Container(
                      clipBehavior: Clip.hardEdge,
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(smallPadding),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.3),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500)),
                        child: widget.profileImage == null
                            ? SizedBox()
                            : Image.network(
                                widget.profileImage!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                      )),
                  if (widget.profileImage == null)
                    Opacity(
                      opacity: .7,
                      child: Image.asset(
                        'assets/icons/upload.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ),
                  if (_uploading)
                    CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                ],
              ),
            ),
          ],
        ),
        Text(
          'قم بإضافة صورة حتي يبدو حسابك بشكل أفضل',
          style: h5InactiveTextStyle,
        ),
        VSpace(),
        SubmitFormButton(onTap: widget.incrementActiveIndex, title: 'التالي'),
        BackStepFormButton(onTap: widget.decrementActiveIndex),
      ],
    );
  }
}
