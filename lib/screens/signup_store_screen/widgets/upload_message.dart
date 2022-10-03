import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';

class UploadMessage extends StatelessWidget {
  final String? storeLogoPhoto;
  final String? storeCoverPhoto;
  const UploadMessage({
    Key? key,
    required this.storeCoverPhoto,
    required this.storeLogoPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      storeLogoPhoto == null && storeCoverPhoto == null
          ? 'صورة اللوجو والغلاف تساعد الزبائن في التعرف علي متجرك'
          : "الان سيبدو متجرك بشكل أفضل بكثير",
      style: h4TextStyle.copyWith(color: kInActiveTextColor),
    );
  }
}
