// ignore_for_file: prefer_const_constructors

import 'package:project/models/customer_gender_model.dart';
import 'package:uuid/uuid.dart';

List<CustomerGenderModel> gendersConstants = [
  CustomerGenderModel(title: 'حريمي', id: Uuid().v4()),
  CustomerGenderModel(title: 'أطفالي', id: Uuid().v4()),
  CustomerGenderModel(title: 'رجالي', id: Uuid().v4()),
];
