import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/fake_data/wishlists.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/utils/bools.dart';
import 'package:provider/provider.dart';

class ProductScreenAppBar extends StatelessWidget {
  final bool? bookMark;
  final String id;
  const ProductScreenAppBar({
    Key? key,
    this.bookMark,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      rightIcon: AppBarIcon(
        color: boolifyNull(bookMark) ? kPrimaryColor : kBlackColor,
        iconName: boolifyNull(bookMark) ? 'bookmark' : 'book-mark',
        onTap: () {
          Provider.of<ProductsProvider>(
            context,
            listen: false,
          ).toggleWishListProduct(id, defaultWhishlists[0].id);
        },
      ),
    );
  }
}
