import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class HPostDesc extends StatelessWidget {
  final String? desc;
  const HPostDesc({
    Key? key,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      desc ?? 'لا يوجد وصف',
      style: h5InactiveTextStyle.copyWith(height: 1.5),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.start,
    );
  }
}
