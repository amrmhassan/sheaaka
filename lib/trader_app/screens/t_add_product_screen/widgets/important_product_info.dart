// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';

class ImportantProductInfo extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController shortDesc;
  final TextEditingController keywords;
  final String fullDesc;
  final Function(String v) setFullDesc;

  const ImportantProductInfo({
    Key? key,
    required this.name,
    required this.shortDesc,
    required this.fullDesc,
    required this.setFullDesc,
    required this.keywords,
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
            initialValue: fullDesc,
            controller: shortDesc,
            requiredField: true,
            title: 'وصف قصير',
            padding: EdgeInsets.zero,
            borderColor: kTraderSecondaryColor.withOpacity(.5),
            borderRadius: BorderRadius.zero,
          ),
          GestureDetector(
            onTap: () {
              TextEditingController fullDescController =
                  TextEditingController();
              fullDescController.text = fullDesc;
              showBottomSheet(
                  elevation: 4,
                  clipBehavior: Clip.none,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (ctx) {
                    return ModalWrapper(
                      onApply: () {},
                      applyButtonTitle: 'تم',
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: fullDescController,
                              onChange: (v) {
                                setFullDesc(v);
                              },
                              title: 'اكتب الوصف هنا',
                              maxLines: 4,
                              textInputAction: TextInputAction.newline,
                              padding: EdgeInsets.zero,
                              borderColor:
                                  kTraderSecondaryColor.withOpacity(.5),
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text(
              'إضافة وصف مفصل',
              style: h3TextStyle.copyWith(
                  color: kTraderPrimaryColor,
                  decoration: TextDecoration.underline),
            ),
          ),
          VSpace(),
          Text(
            'أضف كل جملة مفتاحية في سطر جديد',
            style: h4TextStyleInactive.copyWith(
              color: kTraderSecondaryColor,
              height: 1,
            ),
          ),
          CustomTextField(
            maxLines: 3,
            minLines: 1,
            textInputAction: TextInputAction.newline,
            title: 'إضافة كلمات مفتاحية',
            controller: keywords,
            padding: EdgeInsets.zero,
            borderColor: kTraderSecondaryColor.withOpacity(.5),
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
    );
  }
}
