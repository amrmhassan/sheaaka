// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/shimmer_loaders/post_simmer_loading/post_shimmer_loading.dart';

class LoadingImageGridShimmer extends StatelessWidget {
  const LoadingImageGridShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShimmerWrapper(
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: [
            ...List.generate(
              50,
              (index) => Container(
                color: shimmerContainerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
