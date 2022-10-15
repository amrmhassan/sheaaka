// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/offer_screen/show_single_image.dart';

class FullPostImage extends StatelessWidget {
  final List<String> imagesPath;
  final Function(int i) setActiveDot;
  const FullPostImage({
    Key? key,
    required this.imagesPath,
    required this.setActiveDot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController c = CarouselController();
    return CarouselSlider(
      carouselController: c,
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 1,
        onPageChanged: (index, reason) {
          setActiveDot(index);
        },
      ),
      items: List.generate(
        imagesPath.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ShowSingleImage.routeName,
                arguments: imagesPath[index]);
          },
          child: FadeInImage(
            placeholder: AssetImage('assets/images/placeholder.png'),
            placeholderFit: BoxFit.cover,
            image: NetworkImage(
              imagesPath[index],
            ),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
