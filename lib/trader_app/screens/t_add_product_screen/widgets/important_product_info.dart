// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';

class ImportantProductInfo extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController shortDesc;

  const ImportantProductInfo({
    Key? key,
    required this.name,
    required this.shortDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: name,
            requiredField: true,
            title: 'اسم المنتج',
            padding: EdgeInsets.zero,
            borderColor: kTraderSecondaryColor.withOpacity(.5),
            borderRadius: BorderRadius.zero,
          ),
          VSpace(),
          CustomTextField(
            controller: shortDesc,
            requiredField: true,
            title: 'وصف قصير',
            padding: EdgeInsets.zero,
            borderColor: kTraderSecondaryColor.withOpacity(.5),
            borderRadius: BorderRadius.zero,
          ),
          Text(
            'إضافة وصف مفصل',
            style: h3TextStyle.copyWith(
                color: kTraderPrimaryColor,
                decoration: TextDecoration.underline),
          ),
          VSpace(),
          CustomTextField(
            title: 'إضافة كلمات مفتاحية',
            padding: EdgeInsets.zero,
            borderColor: kTraderSecondaryColor.withOpacity(.5),
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
    );
  }
}
