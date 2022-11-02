// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/global/widgets/empty_widget.dart';

class LoadedImgesGrid extends StatelessWidget {
  const LoadedImgesGrid({
    Key? key,
    required this.links,
  }) : super(key: key);

  final List<String> links;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: links.isNotEmpty
          ? GridView.count(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(
                links.length,
                (index) => FadeInImage(
                  placeholder: loadingImage,
                  image: NetworkImage(
                    links[index],
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ),
            )
          : EmptyWidget(title: 'قم برفع منتجات حتي تتوافر الصور هنا'),
    );
  }
}
