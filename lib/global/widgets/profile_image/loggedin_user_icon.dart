import 'package:flutter/material.dart';

class LoggedInUserIcon extends StatelessWidget {
  const LoggedInUserIcon({
    Key? key,
    required this.radius,
    required this.padding,
    required this.border,
    required this.imagePath,
    this.color,
  }) : super(key: key);

  final double? radius;
  final EdgeInsets? padding;
  final Border? border;
  final String? imagePath;
  final Color? color;

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
          imagePath ?? 'assets/icons/user.png',
          fit: BoxFit.cover,
          width: double.infinity,
          alignment: Alignment.topCenter,
          color: color,
        ),
      ),
    );
  }
}
