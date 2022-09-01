import 'package:flutter/material.dart';
import 'package:project/screens/cart_screen/widgets/cart_product.dart';
import 'package:project/screens/cart_screen/widgets/cart_products_separator.dart';

class CartProductWrapper extends StatelessWidget {
  final bool showAfterSeparator;
  final bool selected;
  const CartProductWrapper({
    Key? key,
    this.showAfterSeparator = true,
    this.selected = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartProduct(
          selected: selected,
        ),
        if (showAfterSeparator) const CartProductsSeparator(),
      ],
    );
  }
}
