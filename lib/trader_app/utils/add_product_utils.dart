// ignore_for_file: prefer_const_constructors

//? to show add color Dialog
import 'package:flutter/material.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/dialog_wrapper.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/product_screen/widgets/product_color_element.dart';
import 'package:project/screens/product_screen/widgets/product_size_element.dart';

void showAddColorDialog({
  required BuildContext context,
  required List<Color> availableColors,
  required Function(Color color) removeColor,
  required Function(Color color) addColor,
}) {
  showDialog(
    context: context,
    useSafeArea: true,
    builder: (ctx) {
      return DialogWrapper(
        margin: EdgeInsets.symmetric(horizontal: kHPad * 2),
        child: StatefulBuilder(builder: (context, localSetState) {
          List<Color> localColors = [...availableColors];
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: productColors.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              childAspectRatio: 1,
              crossAxisSpacing: kHPad / 2,
              mainAxisSpacing: kHPad / 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              Color currentColor = productColors[index];
              return ProductColorElement(
                color: currentColor,
                onTap: () {
                  if (localColors.contains(currentColor)) {
                    localSetState(() {
                      localColors.add(currentColor);
                    });
                    removeColor(currentColor);
                  } else {
                    localSetState(() {
                      localColors.remove(currentColor);
                    });
                    addColor(currentColor);
                  }
                },
                border: currentColor == Colors.white,
                active: localColors.contains(currentColor),
              );
            },
          );
        }),
      );
    },
  );
}

void showAddSizeDialog({
  required BuildContext context,
  required List<Sizes> availableSizes,
  required Function(Sizes color) removeSize,
  required Function(Sizes color) addSize,
}) {
  showDialog(
    context: context,
    useSafeArea: true,
    builder: (ctx) {
      return DialogWrapper(
        margin: EdgeInsets.symmetric(horizontal: kHPad * 2),
        child: StatefulBuilder(builder: (context, localSetState) {
          List<Sizes> localSizes = [...availableSizes];
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: actualProductSizes.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              childAspectRatio: 1,
              crossAxisSpacing: kHPad / 2,
              mainAxisSpacing: kHPad / 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              Sizes currentSize = actualProductSizes[index];
              return ProductSizeElement(
                size: currentSize,
                onTap: () {
                  if (localSizes.contains(currentSize)) {
                    localSetState(() {
                      localSizes.add(currentSize);
                    });
                    removeSize(currentSize);
                  } else {
                    localSetState(() {
                      localSizes.remove(currentSize);
                    });
                    addSize(currentSize);
                  }
                },
                active: localSizes.contains(currentSize),
              );
            },
          );
        }),
      );
    },
  );
}
