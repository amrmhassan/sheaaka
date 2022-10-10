// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/global/widgets/profile_image/not_loggedin_user_icon.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/profile_screen/profile_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class LoggedInUserIcon extends StatefulWidget {
  const LoggedInUserIcon({
    Key? key,
    required this.radius,
    required this.padding,
    required this.border,
    this.allowClick = true,
    this.color,
  }) : super(key: key);

  final double? radius;
  final EdgeInsets? padding;
  final Border? border;
  final Color? color;
  final bool allowClick;

  @override
  State<LoggedInUserIcon> createState() => _LoggedInUserIconState();
}

class _LoggedInUserIconState extends State<LoggedInUserIcon> {
  bool loading = false;
  String? userPhoto;

  Future<void> fetchUserPhoto() async {
    setState(() {
      loading = true;
    });
    String? userPhotoPath;
    try {
      String userUID = FirebaseAuth.instance.currentUser!.uid;
      userPhotoPath = await Provider.of<UserProvider>(context, listen: false)
          .getUserPhoto(userUID);
    } catch (e, stack) {
      String errorMessage = CustomError(
        errorType: ErrorsTypes.uploadPhoto,
        stackTrace: stack,
      ).toString();
      showSnackBar(
          context: context,
          message: errorMessage,
          snackBarType: SnackBarType.error);
    }

    setState(() {
      userPhoto = userPhotoPath;
      loading = false;
    });
  }

  @override
  void initState() {
    fetchUserPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : userPhoto == null
            ? NotLoggedInUserIcon(
                imagePath: 'assets/icons/user.png',
                allowClick: widget.allowClick,
              )
            : GestureDetector(
                onTap: widget.allowClick
                    ? () async {
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      }
                    : () {},
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: widget.radius ?? 50,
                  height: widget.radius ?? 50,
                  padding: widget.padding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    border: widget.border,
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: Image.network(
                      userPhoto!,
                      errorBuilder: (context, error, stackTrace) {
                        return NotLoggedInUserIcon(
                          allowClick: widget.allowClick,
                          imagePath: 'assets/icons/user.png',
                        );
                      },
                      fit: BoxFit.cover,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      color: widget.color,
                    ),
                  ),
                ),
              );
  }
}
