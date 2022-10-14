// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/screens_wrapper.dart';

class ShowSingleImage extends StatelessWidget {
  static const String routeName = '/offer-screen';

  const ShowSingleImage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.black, // status bar color
    ));
    var imagePath = ModalRoute.of(context)!.settings.arguments;

    return ScreensWrapper(
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            //? this will be executed when ever the user swipes right
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
            //? this will be executed when ever the user swipes left

          }
        },
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.black,
              child: imagePath is File
                  ? Image.file(imagePath)
                  : Image.network(imagePath as String),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(ultraLargePadding),
                child: Image.asset(
                  'assets/icons/next.png',
                  color: Colors.white,
                  width: largeIconSize,
                  height: largeIconSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
