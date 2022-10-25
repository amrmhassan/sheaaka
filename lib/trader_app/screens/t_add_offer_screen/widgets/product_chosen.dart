import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/product_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_choose_single_product_screen/t_choose_single_product_screen.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';
import 'package:project/utils/general_utils.dart';

class ProductChosen extends StatelessWidget {
  final ProductModel productModel;
  final Function(ProductModel p) setProductModel;
  const ProductChosen({
    super.key,
    required this.productModel,
    required this.setProductModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اضغط مطولا للتغيير',
          style: h4TextStyleInactive.copyWith(
            color: kTraderSecondaryColor.withOpacity(.8),
          ),
        ),
        TraderProductCard(
          productModel: productModel,
          onLongPressed: () async {
            ProductModel? p = await Navigator.pushNamed(
              context,
              TChooseSingleProductsScreen.routeName,
            ) as ProductModel?;
            if (p != null) {
              setProductModel(p);
            } else {
              showSnackBar(context: context, message: 'لم يتم اختيار منتج');
            }
          },
        ),
      ],
    );
  }
}
