// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
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
                  showBottomSheet(
                    elevation: 30,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (ctx) => ModalWrapper(
                      // color: kLightColor,
                      onApply: () {},
                      applyButtonTitle: 'applyButtonTitle',
                      showApplyModalButton: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'اسم صاحب المتجر',
                                style: h3TextStyle,
                              ),
                              Text(
                                'عمرو محمد',
                                style: h3LiteTextStyle,
                              )
                            ],
                          ),
                          VSpace(),
                          Text(
                            'الايميلات',
                            style: h3TextStyle,
                          ),
                          VSpace(),
                          StoreInfoElement(
                            info: 'amrhassanpersonal@gmail.com',
                          ),
                          StoreInfoElement(
                            info: 'amrhassanpersonal@gmail.com',
                          ),
                          StoreInfoElement(
                            info: 'amrhassanpersonal@gmail.com',
                          ),
                          VSpace(),
                          Text(
                            'أرقام الهاتف',
                            style: h3TextStyle,
                          ),
                          VSpace(),
                          StoreInfoElement(
                            info: '01147497502',
                          ),
                          StoreInfoElement(
                            info: '01147497502',
                          ),
                          StoreInfoElement(
                            info: '01147497502',
                          ),
                        ],
                      ),
                    ),
                  );
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

class StoreInfoElement extends StatelessWidget {
  final String info;
  const StoreInfoElement({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info,
          style: h4LiteTextStyle.copyWith(decoration: TextDecoration.underline),
        ),
        ButtonWrapper(
          onTap: () {},
          padding: EdgeInsets.symmetric(
            horizontal: kHPad / 2,
            vertical: kVPad / 3,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(smallBorderRadius),
          ),
          child: Text(
            'نسخ',
            style: h4LiteTextStyle,
          ),
        )
      ],
    );
  }
}
