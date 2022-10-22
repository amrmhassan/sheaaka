// ignore_for_file: prefer_const_constructors

import 'package:project/models/category_model.dart';
import 'package:uuid/uuid.dart';

List<CategoryModel> categoriesConstants = [
  CategoryModel(
    id: 'all',
    icon: '',
    title: 'الكل',
    categoryGenderId: '',
    allOfGender: true,
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/shirt.png',
    title: 'تيشيرت',
    categoryGenderId: 'female',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/polo-shirt.png',
    title: 'بولو',
    categoryGenderId: 'female',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/trousers.png',
    title: 'شروال',
    categoryGenderId: 'female',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/jeans.png',
    title: 'حينز',
    categoryGenderId: 'male',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/cloth.png',
    title: 'قميص',
    categoryGenderId: 'male',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/shorts.png',
    title: 'شورت',
    categoryGenderId: 'male',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/socks.png',
    title: 'جوارب',
    categoryGenderId: 'children',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/baseball-cap.png',
    title: 'قبعة',
    categoryGenderId: 'children',
  ),
  CategoryModel(
    id: Uuid().v4(),
    icon: 'assets/icons/catIcons/oversize.png',
    title: 'اوفر سايز',
    categoryGenderId: 'children',
  ),
];
