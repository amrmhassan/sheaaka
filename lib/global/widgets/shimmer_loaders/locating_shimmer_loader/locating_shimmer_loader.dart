import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/shimmer_loaders/post_simmer_loading/post_shimmer_loading.dart';

class LocatingShimmerLoader extends StatelessWidget {
  const LocatingShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Image.asset(
        'assets/icons/pin.png',
        color: kPrimaryColor,
        width: mediumIconSize,
      ),
    );
  }
}
