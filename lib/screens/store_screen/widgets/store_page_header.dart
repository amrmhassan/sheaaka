// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/screens/store_screen/widgets/store_logo_photo_storage_page.dart';

class StorePageHeader extends StatelessWidget {
  const StorePageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'assets/images/store.jpg',
      width: double.infinity,
      fit: BoxFit.cover,
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
                iconName: 'info1',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Spacer(),
          ],
        ),
        StoreLogoPhotoStorePage(),
      ],
    );
  }
}
