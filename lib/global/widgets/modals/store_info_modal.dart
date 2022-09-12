// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/store_screen/widgets/store_info_element.dart';

class StoreInfoModal extends StatelessWidget {
  const StoreInfoModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
