// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/dialog_wrapper.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_line.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/providers/categories_provider.dart';
import 'package:project/screens/category_viewer_screen/widgets/all_colors_palette.dart';
import 'package:project/screens/category_viewer_screen/widgets/all_filters_button.dart';
import 'package:project/screens/category_viewer_screen/widgets/category_chooser.dart';
import 'package:project/screens/product_screen/widgets/product_color_element.dart';
import 'package:provider/provider.dart';

class CategoryViewerScreen extends StatefulWidget {
  const CategoryViewerScreen({Key? key}) : super(key: key);
  static const String routeName = '/category-viewer-screen';

  @override
  State<CategoryViewerScreen> createState() => _CategoryViewerScreenState();
}

class _CategoryViewerScreenState extends State<CategoryViewerScreen> {
  @override
  Widget build(BuildContext context) {
    var catProvider = Provider.of<CategoriesProvider>(context);

    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(title: catProvider.activeGenderModel.title),
          Row(
            children: [
              AllFiltersButton(),
              VLine(
                color: kSecondaryColor.withOpacity(.1),
              ),
              HSpace(factor: .5),
              CategoryChooser(catProvider: catProvider),
              HSpace(factor: .5),
              categoryColors(catProvider.activeColor, () {
                showDialog(
                  context: context,
                  useSafeArea: true,
                  builder: (ctx) {
                    return DialogWrapper(
                      margin: EdgeInsets.symmetric(horizontal: kHPad * 2),
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: productColors.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 50,
                          childAspectRatio: 1,
                          crossAxisSpacing: kHPad / 2,
                          mainAxisSpacing: kVPad / 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return categoryColors(
                              catProvider.availableColors[index]);
                        },
                      ),
                    );
                  },
                );
              }),
            ],
          ),
          HLine(),
        ],
      ),
    );
  }

//? this will handle showing the colors boxes in the colors dialog
  Widget categoryColors(dynamic item, [VoidCallback? onItemTap]) {
    var catProviderFalse =
        Provider.of<CategoriesProvider>(context, listen: false);
    var catProvider = Provider.of<CategoriesProvider>(context);
    onTap() {
      catProviderFalse.setActiveColor(item);
      Navigator.pop(context);
    }

    if (item is Color) {
      return ProductColorElement(
        color: item,
        onTap: onItemTap ?? onTap,
        border: item == Colors.white,
        active: (item == catProvider.activeColor) && onItemTap == null,
      );
    } else {
      return AllColorsPalette(
        active: (item == catProvider.activeColor) && onItemTap == null,
        onTap: onItemTap ?? onTap,
      );
    }
  }
}
