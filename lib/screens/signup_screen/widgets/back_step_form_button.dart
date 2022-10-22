import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class BackStepFormButton extends StatelessWidget {
  const BackStepFormButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          'السابق',
          style: h3LiteTextStyle.copyWith(),
        ));
  }
}
