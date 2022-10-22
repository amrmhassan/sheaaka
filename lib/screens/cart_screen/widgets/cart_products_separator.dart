//? separating the cart products by a line and a space
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/v_space.dart';

class CartProductsSeparator extends StatelessWidget {
  final double factor = 0.8;
  const CartProductsSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(factor: factor),
        SizedBox(
          width: double.infinity,
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Container(
              color: kSecondaryColor.withOpacity(0.2),
              height: 1,
            ),
          ),
        ),
        VSpace(factor: factor),
      ],
    );
  }
}
