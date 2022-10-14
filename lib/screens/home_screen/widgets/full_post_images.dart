import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        (index) => Image.network(
          imagesPath[index],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
