// ignore_for_file: prefer_const_constructors

import 'package:project/models/category_model.dart';
import 'package:uuid/uuid.dart';

List<CategoryModel> categories = [
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/shirt.png',
    title: 'تيشيرت',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/polo-shirt.png',
    title: 'بولو',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/trousers.png',
    title: 'شروال',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/jeans.png',
    title: 'حينز',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/cloth.png',
    title: 'قميص',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/shorts.png',
    title: 'شورت',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/socks.png',
    title: 'جوارب',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/baseball-cap.png',
    title: 'قبعة',
  ),
];
