import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class HPostDesc extends StatelessWidget {
  const HPostDesc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'وصف المنتج وصف المنتج وصف المننتج وصف المنتج وصف المننتج وصف المنتج وصف المنتج وصف المنتج وصف المنتج ',
      style: h5InactiveTextStyle.copyWith(height: 1.5),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
