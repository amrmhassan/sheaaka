// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';

class ProductDescriptionText extends StatelessWidget {
  final String desc;
  const ProductDescriptionText({
    Key? key,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (ctx) {
              return ModalWrapper(
                onApply: () {},
                applyButtonTitle: 'applyButtonTitle',
                showApplyModalButton: false,
                child: Row(
                  children: [
                    Text(
                      desc,
                      style: h4TextStyleInactive,
                    ),
                  ],
                ),
              );
            });
      },
      child: Text(
        desc,
        style: h4TextStyleInactive,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
