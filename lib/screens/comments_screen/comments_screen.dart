// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/profile_image/profile_image.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/store_screen/store_screen.dart';
import 'package:project/screens/store_screen/widgets/store_category_element.dart';
import 'package:project/screens/store_screen/widgets/taps.dart';

class CommentsScreen extends StatelessWidget {
  static const String routeName = '/route-name';
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'الأسألة الشائعة',
            boundRightIconWidth: true,
          ),
          // Container(
          //   width: double.infinity,
          //   height: 50,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     boxShadow: [
          //       BoxShadow(
          //         offset: Offset(0, 6),
          //         color: Colors.grey.withOpacity(.2),
          //         blurRadius: 6,
          //       ),
          //     ],
          //   ),
          //   child: Row(
          //     children: [
          //       HSpace(
          //         factor: 1,
          //       ),
          //       Text(
          //         'التعليقات',
          //         style: h3LiteTextStyle,
          //       ),
          //     ],
          //   ),
          // ),
          Taps(
            taps: [
              SizedBox(width: storeTitleHSpace),
              StoreCategoryElement(
                title: 'التعليقات',
                style: h3LiteTextStyle,
                number: 6,
                active: true,
              ),
              StoreCategoryElement(
                title: 'الأسئلة الشائعة',
                style: h3LiteTextStyle,
                number: 8,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  VSpace(),
                  Comment(),
                  Comment(),
                  Comment(),
                  Comment(),
                  Comment(),
                  Comment(),
                  Comment(),
                ],
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: kHPad, vertical: kVPad / 2),
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(.1),
              boxShadow: [defaultBoxShadow],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(mediumBorderRadius),
                    ),
                    child: Text('اكتب تعليقا'),
                  ),
                ),
                HSpace(),
                ButtonWrapper(
                  onTap: () {},
                  backgroundColor: Colors.transparent,
                  borderRadius: 500,
                  child: Container(
                    padding: EdgeInsets.all(largePadding),
                    width: largeIconSize + 5,
                    height: largeIconSize + 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/icons/reverse-paper-plane.png',
                      color: kPrimaryColor,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
        margin: EdgeInsets.only(bottom: mediumPadding),
        width: Responsive.getWidth(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImage(),
            HSpace(factor: .8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'عمرو محمد',
                        style: h3LiteTextStyle,
                      ),
                      HSpace(),
                      Text(
                        '20/8/2022',
                        style: h5InactiveTextStyle,
                      ),
                    ],
                  ),
                  VSpace(factor: .3),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: kHPad / 2, vertical: kVPad / 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(smallBorderRadius),
                      color: kSecondaryColor.withOpacity(.1),
                    ),
                    child: Text(
                      'التعليق هناالتعليق هناالتعليتعليق هناالتعليتعليق هناالتعليق هنلتعليتعليق هناالتعليق هنلتعليتعليق هناالتعليق هنلتعليتعليق هناالتعليق هنلتعليتعليق هناالتعليق هنليق هنا',
                      style: h5LiteTextStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
