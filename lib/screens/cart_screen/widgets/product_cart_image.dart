import 'package:flutter/material.dart';

class ProductCartImage extends StatelessWidget {
  const ProductCartImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/1.jpg',
      width: 130,
      height: 130,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
    );
  }
}
