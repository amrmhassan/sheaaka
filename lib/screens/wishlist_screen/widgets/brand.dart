// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/brands_constants.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/brand_model.dart';

class Brand extends StatelessWidget {
  final BrandModel? brand;
  final Color? color;
  const Brand({
    Key? key,
    this.brand,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String handleBrandImage(BrandModel? brand) {
      if (brand == null) {
        return emptyBrand.icon!;
      } else if (brand.icon == null) {
        return emptyBrand.icon!;
      } else {
        return brand.icon!;
      }
    }

    return Row(
      children: [
        brand == null
            ? SizedBox()
            : Image.asset(
                handleBrandImage(brand),
                width: smallIconSize,
                color: color ?? kSecondaryColor,
              ),
        HSpace(factor: .2),
        Text(
          (brand == null) ? emptyBrand.name : brand!.name,
          style: h4TextStyleInactive.copyWith(color: color),
        )
      ],
    );
  }
}
