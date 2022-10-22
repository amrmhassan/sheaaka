// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

Duration _animationDuration = Duration(milliseconds: 500);
Color _color1 = Colors.grey.withOpacity(.4);
Color _color2 = Colors.grey.withOpacity(.1);

class LoadingImage extends StatefulWidget {
  const LoadingImage({super.key});

  @override
  State<LoadingImage> createState() => _LoadingImageState();
}

class _LoadingImageState extends State<LoadingImage> {
  late Timer t;
  late Color color;
  @override
  void initState() {
    color = _color1;
    Timer.periodic(_animationDuration, (timer) {
      if (color == _color1) {
        setState(() {
          color = _color2;
        });
      } else {
        setState(() {
          color = _color1;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        t.cancel();
      },
      child: AnimatedContainer(
        duration: _animationDuration,
        width: double.infinity,
        height: double.infinity,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/clothes-hanger.png',
              width: ultraLargeIconSize,
            ),
          ],
        ),
      ),
    );
  }
}
