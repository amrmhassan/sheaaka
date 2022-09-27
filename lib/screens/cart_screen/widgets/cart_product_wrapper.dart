import 'package:flutter/material.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/screens/cart_screen/widgets/cart_product.dart';
import 'package:project/screens/cart_screen/widgets/cart_products_separator.dart';
import 'package:provider/provider.dart';

class CartProductWrapper extends StatelessWidget {
  final bool showAfterSeparator;
  final CartItemModel cartItemModel;
  final String cartItemId;

  const CartProductWrapper({
    Key? key,
    this.showAfterSeparator = true,
    required this.cartItemModel,
    required this.cartItemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWrapper(
          backgroundColor: Colors.transparent,
          borderRadius: 0,
          onLongPress: () {
            Provider.of<CartProvider>(context, listen: false)
                .toggleSelectCartItem(cartItemId);
          },
          child: CartProduct(
            selected: cartItemModel.selected,
            cartItemModel: cartItemModel,
          ),
        ),
        if (showAfterSeparator) const CartProductsSeparator(),
      ],
    );
  }
}
