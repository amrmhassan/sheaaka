import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';

class UploadingProduct extends StatelessWidget {
  const UploadingProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: productImageDimensions,
      child: Lottie.asset(
        'assets/animations/upload-edited.json',
      ),
    );
  }
}
