// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';

class StoreAllProductsGrid extends StatelessWidget {
  const StoreAllProductsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! make the whole page to scroll and stop the grid from scrolling
    //! make the taps to float in the of the screen when reaching the top while scrolling
    return GridView.count(
      // padding: EdgeInsets.symmetric(vertical: kVPad),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(
        12,
        (index) => Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            // borderRadius: BorderRadius.circular(smallBorderRadius),
            border: Border.all(
              width: 1,
              color: kSecondaryColor.withOpacity(.1),
            ),
          ),
        ),
      ),
    );
  }
}
