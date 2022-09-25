import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/utils/screens_utils/post_actions_utils.dart';

class ProductScreenAppBar extends StatelessWidget {
  final bool? bookMark;
  final String id;
  final bool loading;
  const ProductScreenAppBar({
    Key? key,
    this.bookMark,
    required this.id,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      rightIcon: loading
          ? null
          : handleShowBookMarkButtonAppBarIcon(context, id, bookMark),
    );
  }
}
