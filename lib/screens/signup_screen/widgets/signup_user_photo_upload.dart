// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/signup_screen/widgets/back_step_form_button.dart';
import 'package:project/utils/photo_utils.dart';

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

//? to start the loading
  void startLoading() {
    setState(() {
      _uploading = true;
    });
  }

//? to end the loading
  void endLoading() {
    setState(() {
      _uploading = false;
    });
  }

//? for handling picking image
  void handlePickImage(ImageSource imageSource) => pickImage(
        context: context,
        callBack: widget.setProfilePhoto,
        source: imageSource,
        setStartLoading: startLoading,
        setEndLoading: endLoading,
        cloudFolderName: profileImagesDir,
      );

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
              onTap: _uploading
                  ? () {}
                  : () => showPickImageOptions(context, handlePickImage),
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
        if (widget.profileImage == null)
          Text(
            'قم بإضافة صورة حتي يبدو حسابك بشكل أفضل',
            style: h5InactiveTextStyle,
          ),
        VSpace(),
        SubmitFormButton(
            onTap: widget.incrementActiveIndex,
            title: widget.profileImage == null ? 'تخطي' : 'التالي'),
        BackStepFormButton(onTap: widget.decrementActiveIndex),
      ],
    );
  }
}
