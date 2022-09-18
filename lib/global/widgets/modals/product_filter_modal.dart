// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/modal_wrapper/widgets/choose_product_type.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/screens/product_screen/widgets/choose_product_color.dart';
import 'package:project/screens/product_screen/widgets/choose_product_size.dart';
import 'package:provider/provider.dart';

class ProductFiltersModal extends StatefulWidget {
  const ProductFiltersModal({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductFiltersModal> createState() => _ProductFiltersModalState();
}

class _ProductFiltersModalState extends State<ProductFiltersModal> {
  late bool onlyOffersLocal;
  @override
  void initState() {
    setState(() {
      onlyOffersLocal =
          Provider.of<ProductsProvider>(context, listen: false).onlyOffers;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<ProductsProvider>(context, listen: false)
                .toggleOnlyOffers();
            setState(() {
              onlyOffersLocal = !onlyOffersLocal;
            });
          },
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'عروض فقط',
                    style: h2TextStyle,
                  ),
                  Spacer(),
                  ProductCartCheckBox(checked: onlyOffersLocal, onTap: () {}),
                ],
              ),
              VSpace(factor: .5),
            ],
          ),
        ),
        HLine(),
        VSpace(factor: .5),
        ChooseProductSize(
          availableSizes: dc.fProducts[0].availableSize,
        ),
        VSpace(),
        ChooseProductColor(),
        VSpace(),
        ChooseProductType(),
      ],
    );
  }
}
