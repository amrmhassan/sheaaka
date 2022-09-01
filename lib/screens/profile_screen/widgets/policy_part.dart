// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/profile_screen/widgets/policy_element.dart';

class PolicyPart extends StatelessWidget {
  const PolicyPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PolicyElement(
          title: 'سياسة الإستخدام',
          onTap: () {},
        ),
        Spacer(),
        PolicyElement(
          title: 'الخصوصية',
          onTap: () {},
        ),
      ],
    );
  }
}
