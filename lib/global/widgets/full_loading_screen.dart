import 'package:flutter/material.dart';
import 'package:project/global/widgets/loading.dart';
import 'package:project/helpers/responsive.dart';

class FullLoadingScreen extends StatelessWidget {
  final String title;
  const FullLoadingScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.getWidth(context),
      height: Responsive.getCleanHeight(context),
      child: Loading(
        title: title,
      ),
    );
  }
}
