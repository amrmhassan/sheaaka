// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SliverTutorial extends StatelessWidget {
  const SliverTutorial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          stretch: true,
          backgroundColor: Colors.transparent,
          expandedHeight: 280,
          leading: Text('Leading'),
          actions: [Text('actions')],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/3.jpg',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) => Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
