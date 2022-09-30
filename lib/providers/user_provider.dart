// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/types.dart';
import 'package:project/models/user_model.dart';
import 'package:project/utils/general_utils.dart';
import 'package:uuid/uuid.dart';

class UserProvider extends ChangeNotifier {
  Future<void> signUserUp({
    required String email,
    required String password,
    required String phone,
    required String address,
    required DateTime birthDate,
    required LatLng? location,
    required UserGender userGender,
    required UserRole userRole,
    required BuildContext context,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      //? add the data to the firebase users table
      UserModel newUser = UserModel(
        id: Uuid().v4(),
        email: email,
        address: address,
        birthDate: birthDate,
        location: location,
        phone: phone,
        userGender: userGender,
        userRole: userRole,
        signupAt: DateTime.now(),
      );
      await FirebaseFirestore.instance
          .collection(usersCollectionName)
          .doc(credential.user!.uid)
          .set(newUser.toJSON());
      showSnackBar(context, 'تم التسجيل بنجاح', SnackBarType.success);
    } else {
      throw Exception('Unknown Error');
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserModel> getUserData(String userUID) async {
    var userData = await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(userUID)
        .get();
    UserModel userModel =
        UserModel.fromJSON(userData.data() as Map<String, dynamic>);

    return userModel;
  }
}
