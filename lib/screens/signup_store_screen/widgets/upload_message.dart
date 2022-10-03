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

  String getMessage() {
    if (storeCoverPhoto == null && storeLogoPhoto == null) {
      return 'صورة اللوجو والغلاف تساعد الزبائن في التعرف علي متجرك';
    } else if (storeCoverPhoto == null) {
      return 'صورة الغلاف تجعل لك هوية مميزة عند الزبائن';
    } else if (storeLogoPhoto == null) {
      return 'تساعد صورة اللوجو في تذكير الزبائن بك';
    } else {
      return 'الان سيبدو متجرك بشكل أفضل بكثير';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getMessage(),
      style: h4TextStyle.copyWith(color: kInActiveTextColor),
    );
  }
}
