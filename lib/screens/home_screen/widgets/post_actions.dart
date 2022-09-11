// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/fake_data/wishlists.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/modals/add_to_wishlist_modal.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/utils/bools.dart';
import 'package:provider/provider.dart';

class PostActions extends StatelessWidget {
  final bool? bookMarked;
  final bool? loved;
  final int lovesNumber;
  final String id;

  const PostActions({
    Key? key,
    this.bookMarked,
    this.loved,
    required this.lovesNumber,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boolifyNull(bookMarked)
              ? CustomIconButton(
                  iconName: 'bookmark',
                  onTap: () {
                    Provider.of<ProductsProvider>(context, listen: false)
                        .toggleWishListProduct(id, defaultWhishlists[0].id);
                  },
                  color: kPrimaryColor,
                )
              : CustomIconButton(
                  iconName: 'book-mark',
                  onTap: () {
                    Provider.of<ProductsProvider>(context, listen: false)
                        .toggleWishListProduct(id, defaultWhishlists[0].id);
                    // showModalBottomSheet(
                    //   context: context,
                    //   backgroundColor: Colors.transparent,
                    //   builder: (ctx) => AddToWishlistModal(),
                    // );
                  }),
          Spacer(),
          CustomIconButton(iconName: 'share', onTap: () {}),
          HSpace(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              boolifyNull(loved)
                  ? CustomIconButton(
                      iconName: 'heart2',
                      onTap: () {
                        Provider.of<ProductsProvider>(context, listen: false)
                            .toggleFavProduct(id);
                      },
                      color: kLoveColor,
                    )
                  : CustomIconButton(
                      iconName: 'heart',
                      onTap: () {
                        Provider.of<ProductsProvider>(context, listen: false)
                            .toggleFavProduct(id);
                      }),
              Text(
                lovesNumber.toString(),
                textAlign: TextAlign.justify,
                style: h4TextStyleInactive.copyWith(height: 1),
              )
            ],
          ),
        ],
      ),
    );
  }
}
