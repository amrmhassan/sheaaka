// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/search_screen/search_screen.dart';
import 'package:project/screens/store_screen/widgets/store_logo_photo_storage_page.dart';

class StorePageHeader extends StatelessWidget {
  final String? logoImagePath;
  final String coverImagePath;
  final String storeId;

  const StorePageHeader({
    Key? key,
    required this.coverImagePath,
    required this.logoImagePath,
    required this.storeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = FadeInImage(
      fadeInDuration: fadeInImageDuration,
      fadeOutDuration: fadeInImageDuration,
      placeholder: loadingImage,
      image: NetworkImage(
        coverImagePath,
      ),
      width: double.infinity,
      fit: BoxFit.cover,
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey.withOpacity(.5),
          child: Opacity(
            opacity: .5,
            child: Image.asset(
              'assets/icons/image.png',
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 200,
          child: image,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              rightIcon: AppBarIcon(
                iconName: 'search',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SearchScreen.routeName,
                    arguments: {
                      'searchType': SearchTypes.storeProducts,
                      'storeId': storeId,
                    },
                  );
                },
              ),
            ),
            // Spacer(),
          ],
        ),
        StoreLogoPhotoStorePage(imagePath: logoImagePath),
      ],
    );
  }
}
