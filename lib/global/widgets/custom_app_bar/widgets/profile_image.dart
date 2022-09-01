import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double? radius;
  final Border? border;
  final EdgeInsets? padding;

  const ProfileImage({
    Key? key,
    this.border,
    this.padding,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: radius ?? 50,
      height: radius ?? 50,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        border: border,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
        ),
        child: Image.asset(
          'assets/images/profile.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
