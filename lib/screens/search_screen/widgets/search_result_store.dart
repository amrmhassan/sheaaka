// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/models/store_model.dart';
import 'package:project/screens/store_screen/store_screen.dart';

class SearchResultStore extends StatelessWidget {
  final StoreModel storeModel;

  const SearchResultStore({
    Key? key,
    required this.storeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, StoreScreen.routeName,
            arguments: storeModel.id);
      },
      margin: EdgeInsets.only(bottom: kVPad / 2),
      padding: EdgeInsets.symmetric(horizontal: kHPad),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
            ),
            child: storeModel.logoImagePath == null
                ? Image.asset(
                    'assets/icons/user.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    storeModel.logoImagePath!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          HSpace(),
          Text(storeModel.name),
          Spacer(),
          if (storeModel.rating != null) Rating(rating: storeModel.rating),
        ],
      ),
    );
  }
}
