import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/constants/styles.dart';

class Loading extends StatelessWidget {
  final String? title;
  const Loading({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (title != null)
          Text(
            title!,
            style: h3InactiveTextStyle,
          ),
        SizedBox(
          width: 200,
          height: 200,
          child: Lottie.asset(
            'assets/animations/loading1.json',
            animate: true,
            reverse: true,
          ),
        )
      ],
    );
  }
}
