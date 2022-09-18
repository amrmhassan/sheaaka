// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/modals/product_filter_modal.dart';
import 'package:project/providers/products_provider.dart';
import 'package:provider/provider.dart';

class FiltersIcon extends StatelessWidget {
  const FiltersIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => ModalWrapper(
            applyButtonTitle: 'تطبيق الفلتر',
            onApply: () {
              Provider.of<ProductsProvider>(context, listen: false)
                  .applyHomeFilters();
            },
            child: ProductFiltersModal(),
          ),
        );
      },
      width: mediumIconSize + largePadding * 2,
      height: mediumIconSize + largePadding * 2,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(largePadding),
      child: Image.asset(
        'assets/icons/filter.png',
        color: kBlackColor,
        width: mediumIconSize,
        height: mediumIconSize,
      ),
    );
  }
}
