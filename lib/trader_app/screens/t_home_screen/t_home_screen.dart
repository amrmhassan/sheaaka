// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_home_screen/widgets/trader_home_element.dart';

class THomeScreen extends StatelessWidget {
  const THomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        children: [
          VSpace(factor: 2),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                TraderHomeElement(
                  iconName: 'wardrobe',
                  onTap: () {},
                  title: 'المنتجات',
                  value: '26',
                ),
                TraderHomeElement(
                  iconName: 'megaphone',
                  onTap: () {},
                  title: 'عروض ممولة',
                  value: '34',
                ),
                TraderHomeElement(
                  iconName: 'offer',
                  onTap: () {},
                  title: 'العروض',
                  value: '2',
                ),
                TraderHomeElement(
                  iconName: 'sections',
                  onTap: () {},
                  title: 'أقسام المحل',
                  value: '4',
                ),
                TraderHomeElement(
                  iconName: 'fire1',
                  onTap: () {},
                  title: 'الترند',
                  value: '9',
                ),
                CertifiedHeader(title: 'محل موثوق'),
                VSpace(factor: .5),
                TraderHomeElement(
                  iconName: 'gallery',
                  onTap: () {},
                  title: 'مكتبة الصور',
                  value: '60',
                ),
                Row(
                  children: [
                    Expanded(
                      child: TraderHomeElement(
                        title: 'فئات الملابس',
                        onTap: () {},
                      ),
                    ),
                    HSpace(),
                    Expanded(
                      child: TraderHomeElement(
                        title: 'مراجعة المنتجات',
                        onTap: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CertifiedHeader extends StatelessWidget {
  final String title;
  const CertifiedHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: h4TextStyleInactive.copyWith(color: kTraderSecondaryColor),
        ),
        HSpace(factor: .5),
        Expanded(
          child: HLine(
            thickness: 2,
            color: kTraderSecondaryColor.withOpacity(.2),
          ),
        ),
      ],
    );
  }
}
