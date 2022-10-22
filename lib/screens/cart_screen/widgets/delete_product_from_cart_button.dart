// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class DeleteProductFromCartButton extends StatelessWidget {
  final String cartItemId;
  const DeleteProductFromCartButton({
    Key? key,
    required this.cartItemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      width: 30,
      height: 30,
      borderRadius: 500,
      backgroundColor: kSecondaryColor.withOpacity(0.1),
      onTap: () {
        Provider.of<CartProvider>(context, listen: false)
            .deleteCartItem(cartItemId);
      },
      padding: EdgeInsets.all(mediumPadding),
      child: Image.asset('assets/icons/delete.png', color: kDangerColor),
    );
  }
}
