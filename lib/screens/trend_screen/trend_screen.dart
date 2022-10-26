// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/genders_constants.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/group_header.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/trader_app/providers/ads_provider.dart';
import 'package:provider/provider.dart';

//? this screen will have the trending products depending on the gender
//? and the best offers
//? it will has all sorts of products cards like Trending, best offers....

class TrendScreen extends StatefulWidget {
  static const String routeName = '/trend-screen';
  const TrendScreen({super.key});

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  //? user gender
  String activeGenderId = gendersConstants.first.id;
  void setActiveGender(String g) {
    setState(() {
      activeGenderId = g;
    });
  }

  @override
  Widget build(BuildContext context) {
    var ads = Provider.of<AdsProvider>(context, listen: false).ads;
    return Column(
      children: [
        VSpace(factor: .5),
        HLine(),
        GroupHeader(
          title: 'العروض',
          subTitle: 'الكل',
          onTap: () {},
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: Responsive.getWidth(context) / 1.5,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                HSpace(),
                ...ads.map(
                  (e) => AdsCard(adsModel: e),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AdsCard extends StatelessWidget {
  final AdsModel adsModel;
  const AdsCard({
    Key? key,
    required this.adsModel,
  }) : super(key: key);

  double getFullCardHeight(BuildContext context) {
    final double fullWidth = Responsive.getWidth(context) / 2;
    return fullWidth;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: adsModel.id,
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: getFullCardHeight(context),
        height: Responsive.getWidth(context) / 1.5,
        margin: EdgeInsets.only(left: kHPad / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallBorderRadius),
          color: Colors.white,
          boxShadow: [
            defaultBoxShadow,
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: FadeInImage(
                placeholder: loadingImage,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                image: NetworkImage(
                  adsModel.imagePath,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    adsModel.productName,
                    style: h3LiteTextStyle,
                  ),
                  Text(
                    adsModel.storeName,
                    style: h3LiteTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
