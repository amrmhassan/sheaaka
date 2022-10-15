// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/store_screen/widgets/store_info_element.dart';

class StoreInfoModal extends StatelessWidget {
  final List<String> phones;
  final List<String> emails;

  const StoreInfoModal({
    Key? key,
    required this.emails,
    required this.phones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'اسم صاحب المتجر',
        //       style: h3TextStyle,
        //     ),
        //     Text(
        //       'عمرو محمد',
        //       style: h3LiteTextStyle,
        //     )
        //   ],
        // ),
        if (emails.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(),
              Text(
                'الايميلات',
                style: h3TextStyle,
              ),
              VSpace(),
              ...emails.map((e) => StoreInfoElement(info: e)),
            ],
          ),
        if (phones.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(),
              Text(
                'أرقام الهاتف',
                style: h3TextStyle,
              ),
              VSpace(),
              ...phones.map((e) => StoreInfoElement(info: e)),
            ],
          ),
      ],
    );
  }
}
