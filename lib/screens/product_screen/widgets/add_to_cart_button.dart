// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatefulWidget {
  final bool active;
  final String? title;
  final ProductModel productModel;
  final Color? chosenColor;
  final Sizes? chosenSize;

  const AddToCartButton({
    Key? key,
    this.active = true,
    this.title,
    required this.productModel,
    required this.chosenColor,
    required this.chosenSize,
  }) : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  String? innerTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonWrapper(
        active: widget.active,
        onTap: () {
          Provider.of<CartProvider>(context, listen: false).addCartItem(
            widget.productModel.id,
            widget.chosenColor,
            widget.chosenSize,
            widget.productModel.name,
            widget.productModel.imagesPath[0],
            widget.productModel.price,
          );
          setState(() {
            innerTitle = 'تمت إضافته للسلة';
          });
        },
        backgroundColor:
            widget.active ? kPrimaryColor : kSecondaryColor.withOpacity(.5),
        padding: EdgeInsets.symmetric(vertical: kVPad / 2),
        child: Text(
          innerTitle ?? widget.title ?? 'إضافة للسلة',
          style: h3TextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
