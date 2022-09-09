// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/full_post.dart';
import 'package:project/screens/home_screen/widgets/open_search_box.dart';

//? this screen will have the newest products, offers , ads etc...
//? and it's filters will be applied to these products

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(),
        OpenSearchBox(),
        VSpace(),
        HLine(),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                FullPost(),
                FullPost(),
                FullPost(),
                VSpace(factor: .5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
