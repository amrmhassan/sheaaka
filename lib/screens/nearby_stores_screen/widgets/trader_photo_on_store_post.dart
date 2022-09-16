import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class TraderPhotoOnStorePost extends StatelessWidget {
  final String logoPath;
  const TraderPhotoOnStorePost({
    Key? key,
    required this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kVPad,
      left: kHPad,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            logoPath,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
