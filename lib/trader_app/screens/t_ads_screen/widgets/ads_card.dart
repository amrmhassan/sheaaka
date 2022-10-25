// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/utils/general_utils.dart';

const double _imageDimensions = 100;

class AdsCard extends StatelessWidget {
  final AdsModel adsModel;

  const AdsCard({
    Key? key,
    required this.adsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: adsModel.productId,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kVPad / 2),
        color: kTraderSecondaryColor.withOpacity(.08),
        height: _imageDimensions,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: _imageDimensions,
              height: _imageDimensions,
              child: FadeInImage(
                placeholder: loadingImage,
                image: NetworkImage(
                  adsModel.imagePath,
                ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            HSpace(),
            Text(
              adsModel.productName,
              style: h3TextStyle.copyWith(
                color: kTraderBlackColor,
              ),
            ),
            Spacer(),
            Text(
              dateToString(adsModel.endDate),
              style: h3LiteTextStyle.copyWith(
                color: kTraderSecondaryColor,
              ),
            ),
            HSpace(),
          ],
        ),
      ),
    );
  }
}
