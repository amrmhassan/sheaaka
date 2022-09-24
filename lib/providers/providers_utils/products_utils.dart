import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/constants/firebase_constants.dart';

Future<void> getHomeProducts() async {
  FirebaseFirestore ref = FirebaseFirestore.instance;

  var res = await ref
      .collection(smallProductsCollectionName)
      .where('field')
      .limit(5)
      .get();
}
