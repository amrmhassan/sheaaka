// ignore_for_file: prefer_const_constructors

import 'package:project/models/brand_model.dart';
import 'package:uuid/uuid.dart';

BrandModel emptyBrand = BrandModel(
  id: Uuid().v4(),
  name: '',
  icon: 'assets/icons/brand-image.png',
);
BrandModel adidasBrand = BrandModel(
  id: Uuid().v4(),
  name: 'Adidas',
  icon: 'assets/icons/adidas.png',
);
BrandModel firewoodBrand = BrandModel(
  id: Uuid().v4(),
  name: 'Firewood',
);
