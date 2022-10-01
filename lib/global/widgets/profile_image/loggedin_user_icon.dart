// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/global/widgets/profile_image/not_loggedin_user_icon.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/login_screen/login_screen.dart';
import 'package:project/screens/no_internet_screen/no_internet_screen.dart';
import 'package:project/screens/profile_screen/profile_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class LoggedInUserIcon extends StatefulWidget {
  const LoggedInUserIcon({
    Key? key,
    required this.radius,
    required this.padding,
    required this.border,
    this.color,
  }) : super(key: key);

  final double? radius;
  final EdgeInsets? padding;
  final Border? border;
  final Color? color;

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
    String userUID = FirebaseAuth.instance.currentUser!.uid;
    String? userPhotoPath =
        await Provider.of<UserProvider>(context, listen: false)
            .getUserPhoto(userUID);

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
              )
            : GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
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
