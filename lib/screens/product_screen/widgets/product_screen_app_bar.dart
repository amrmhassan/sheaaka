import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/utils/screens_utils/post_actions_utils.dart';

class ProductScreenAppBar extends StatelessWidget {
  final String id;
  final bool loading;
  final String? wishlistItemId;

  const ProductScreenAppBar({
    Key? key,
    required this.id,
    required this.loading,
    required this.wishlistItemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      rightIcon: loading
          ? null
          : handleShowBookMarkButtonAppBarIcon(context, id, wishlistItemId),
    );
  }
}
