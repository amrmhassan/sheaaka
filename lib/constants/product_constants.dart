//? product Colors
import 'package:flutter/material.dart';
import 'package:project/models/types.dart';

const List<Color> productColors = [
  Color(0xffffffff),
  Color(0xff3678bd),
  Color(0xffff8fba),
  Color(0xffb4b4b4),
  Color(0xff222222),
  Color(0xff398451),
  Color(0xffFECF4D),
  Color(0xffA75430),
  Color(0xffDBAB59),
  Color(0xffFD7E4C),
];

List<ColorWithName> productColorsWithName = const [
  ColorWithName(color: Color(0xffffffff), name: 'name'),
  ColorWithName(color: Color(0xff3678bd), name: 'name'),
  ColorWithName(color: Color(0xffff8fba), name: 'name'),
  ColorWithName(color: Color(0xffb4b4b4), name: 'name'),
  ColorWithName(color: Color(0xff222222), name: 'name'),
  ColorWithName(color: Color(0xff398451), name: 'name'),
  ColorWithName(color: Color(0xffA75430), name: 'name'),
  ColorWithName(color: Color(0xffDBAB59), name: 'name'),
  ColorWithName(color: Color(0xffFD7E4C), name: 'name'),
];

const List<Sizes> productSizes = Sizes.values;

class ColorWithName {
  final Color color;
  final String name;

  const ColorWithName({
    required this.color,
    required this.name,
  });
}
