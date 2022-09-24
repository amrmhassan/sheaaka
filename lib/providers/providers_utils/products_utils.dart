// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';

Future<void> getHomeProducts() async {
  FirebaseFirestore ref = FirebaseFirestore.instance;

  var res = await ref
      .collection(smallProductsCollectionName)
      .orderBy(createdAtString)
      .limit(5)
      .get();
}
