import 'package:flutter/animation.dart';
import 'package:project/models/types.dart';

Sizes? stringToSizes(String v) {
  for (var size in Sizes.values) {
    if (v == size.name) {
      return size;
    }
  }
  return null;
}

Color intToColors(int v) {
  return Color(v);
}
