import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class CheckOutButton extends StatelessWidget {
  final VoidCallback onTap;
  const CheckOutButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: kBlackColor,
      onTap: onTap,
      height: 50,
      child: const Text(
        'التالي',
        style: h3LightTextStyle,
      ),
    );
  }
}
