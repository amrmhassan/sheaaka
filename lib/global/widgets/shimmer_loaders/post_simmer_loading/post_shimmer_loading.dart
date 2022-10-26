// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/trader_photo.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:shimmer/shimmer.dart';

class PostSimmerLoading extends StatelessWidget {
  const PostSimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: largePadding * 2),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
      baseColor: shimmerBaseColor,
      highlightColor: shimmerLightColor,
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
        color: shimmerContainerColor,
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
        width: Responsive.getWidth(context) / 3,
        height: 15,
        color: shimmerContainerColor,
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
            color: shimmerIconsColor,
          ),
          Spacer(),
          Image.asset(
            'assets/icons/share.png',
            width: mediumIconSize,
            color: shimmerIconsColor,
          ),
          Row(
            children: [
              HSpace(),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/heart.png',
                    width: mediumIconSize,
                    color: shimmerIconsColor,
                  ),
                  Container(
                    width: 15,
                    height: 5,
                    color: shimmerContainerColor,
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
        color: shimmerContainerColor,
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
      color: shimmerContainerColor,
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
          color: shimmerIconsColor,
        ),
        HSpace(factor: 0.5),
        Image.asset(
          'assets/icons/dots.png',
          width: mediumIconSize,
          color: shimmerIconsColor,
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
          color: shimmerContainerColor,
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
        color: shimmerContainerColor,
        borderRadius: BorderRadius.circular(500),
      ),
    );
  }
}
