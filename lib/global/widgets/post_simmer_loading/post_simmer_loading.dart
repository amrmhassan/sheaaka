// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/trader_photo.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:shimmer/shimmer.dart';

Color color = Colors.grey.withOpacity(.5);
Color iconsColor = Colors.grey.withOpacity(.8);

class PostSimmerLoading extends StatelessWidget {
  const PostSimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: kVPad / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaddingWrapper(
            child: Row(
              children: [
                ShimmerWrapper(child: StoreImagePlace()),
                HSpace(
                  factor: 0.5,
                ),
                StoreNamePlace(),
                Spacer(
                  flex: 1,
                ),
                StoreActionsPlace(),
              ],
            ),
          ),
          VSpace(factor: 0.5),
          ShimmerWrapper(child: ProductImagePlace()),
          VSpace(factor: .3),
          GallaryDotsPlace(),
          VSpace(factor: .3),
          PostActionsPlace(),
          VSpace(factor: .3),
          PaddingWrapper(
            child: Column(
              children: [
                ProductNamePlace(),
                VSpace(factor: .3),
                ProductDescriptionPlace(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerWrapper extends StatelessWidget {
  final Widget child;
  const ShimmerWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.withOpacity(.2),
      child: child,
    );
  }
}

class ProductDescriptionPlace extends StatelessWidget {
  const ProductDescriptionPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Container(
        width: double.infinity,
        height: 10,
        color: color,
      ),
    );
  }
}

class ProductNamePlace extends StatelessWidget {
  const ProductNamePlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Container(
        width: double.infinity,
        height: 15,
        color: color,
      ),
    );
  }
}

class PostActionsPlace extends StatelessWidget {
  const PostActionsPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/book-mark.png',
            width: mediumIconSize,
            color: iconsColor,
          ),
          Spacer(),
          Image.asset(
            'assets/icons/share.png',
            width: mediumIconSize,
            color: iconsColor,
          ),
          Row(
            children: [
              HSpace(),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/heart.png',
                    width: mediumIconSize,
                    color: iconsColor,
                  ),
                  Container(
                    width: 15,
                    height: 5,
                    color: color,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GallaryDotsPlace extends StatelessWidget {
  const GallaryDotsPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 5,
        color: color,
      ),
    );
  }
}

class ProductImagePlace extends StatelessWidget {
  const ProductImagePlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.getWidth(context),
      height: Responsive.getWidth(context),
      color: color,
    );
  }
}

class StoreActionsPlace extends StatelessWidget {
  const StoreActionsPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/add-friend.png',
          width: mediumIconSize,
          color: iconsColor,
        ),
        HSpace(factor: 0.5),
        Image.asset(
          'assets/icons/dots.png',
          width: mediumIconSize,
          color: iconsColor,
        ),
      ],
    );
  }
}

class StoreNamePlace extends StatelessWidget {
  const StoreNamePlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ShimmerWrapper(
        child: Container(
          width: double.infinity,
          height: 10,
          color: color,
        ),
      ),
    );
  }
}

class StoreImagePlace extends StatelessWidget {
  const StoreImagePlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: smallCircleRadius,
      height: smallCircleRadius,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(500),
      ),
    );
  }
}
