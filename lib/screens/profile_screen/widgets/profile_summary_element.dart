import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class ProfileSummaryElement extends StatelessWidget {
  final String title;
  final String amount;
  const ProfileSummaryElement({
    Key? key,
    required this.amount,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            amount,
            style: h2TextStyle,
          ),
          Text(
            title,
            style: h4TextStyleInactive,
          )
        ],
      ),
    );
  }
}
