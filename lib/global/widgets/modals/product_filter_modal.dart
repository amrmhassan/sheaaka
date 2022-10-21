// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/modal_wrapper/widgets/choose_product_type.dart';
import 'package:project/global/widgets/v_space.dart';
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
  // @override
  // void initState() {
  //   setState(() {
  //     onlyOffersLocal =
  //         Provider.of<ProductsProvider>(context, listen: false).onlyOffers;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnlyOffersFilter(
          onTap: () {
            // Provider.of<ProductsProvider>(context, listen: false)
            //     .toggleOnlyOffers();
            // setState(() {
            //   onlyOffersLocal = !onlyOffersLocal;
            // });
          },
          onlyOffersLocal: onlyOffersLocal,
        ),
        HLine(),
        VSpace(factor: .5),
        ChooseProductSize(
          availableSizes: Provider.of<ProductsProvider>(context, listen: false)
              .allProducts[0]
              .availableSize,
          activeSizeIndex: 0,
          setActiveSize: (int x) {},
        ),
        VSpace(),
        ChooseProductColor(
          activeColorIndex: 0,
          colors: productColors,
          setActiveColor: (int i) {},
        ),
        VSpace(),
        ChooseProductType(),
      ],
    );
  }
}

class OnlyOffersFilter extends StatelessWidget {
  final VoidCallback onTap;
  final bool onlyOffersLocal;
  const OnlyOffersFilter({
    super.key,
    required this.onTap,
    required this.onlyOffersLocal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'عروض فقط',
                  style: h2TextStyle,
                ),
                Spacer(),
                ProductCartCheckBox(checked: onlyOffersLocal),
              ],
            ),
            VSpace(factor: .5),
          ],
        ),
      ),
    );
  }
}
