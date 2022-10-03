// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/types.dart';
import 'package:project/models/user_model.dart';
import 'package:project/utils/general_utils.dart';
import 'package:uuid/uuid.dart';

class UserProvider extends ChangeNotifier {
  final GoogleSignIn _google = GoogleSignIn();

  //? sign user up
  Future<void> signUserUp({
    required String email,
    required String userName,
    required String password,
    required String phone,
    required String address,
    required DateTime? birthDate,
    required LatLng? location,
    required UserGender userGender,
    required UserRole userRole,
    required BuildContext context,
    required String? userProfilePhoto,
    required SignMethod signMethod,
    required GoogleSignInAccount? googleSignInAccount,
  }) async {
    User? user;
    if (signMethod == SignMethod.email) {
      user = await firebaseSignUpEmailPassword(email, password);
    } else if (signMethod == SignMethod.google) {
      user = await firebaseSignInGoogle(googleSignInAccount!);
    }
    if (user != null) {
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
        userProfilePhoto: userProfilePhoto,
        userName: userName,
      );
      await FirebaseFirestore.instance
          .collection(usersCollectionName)
          .doc(user.uid)
          .set(newUser.toJSON());
      showSnackBar(context, 'تم التسجيل بنجاح', SnackBarType.success);
    } else {
      throw CustomError(ErrorsTypes.unknownError);
    }
  }

//? login user
  Future<void> loginEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
    required Future<void> Function() fetchAndUpdateFavoriteProducts,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    await fetchAndUpdateFavoriteProducts();
  }

//? get user data by his uid
  Future<UserModel> getUserDataByUID(String userUID) async {
    var userData = await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(userUID)
        .get();
    UserModel userModel =
        UserModel.fromJSON(userData.data() as Map<String, dynamic>);

    return userModel;
  }

//? get user data by email
  Future<UserModel?> getUserDataByEmail(String email) async {
    var data = (await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .where(emailString, isEqualTo: email)
        .get());
    bool empty = data.docs.isEmpty;
    if (empty) {
      return null;
    }
    var userData = data.docs.first.data();
    UserModel userModel = UserModel.fromJSON(userData);
    return userModel;
  }

  //? get user photo path by his uid
  Future<String?> getUserPhoto(String userUID) async {
    UserModel userModel = await getUserDataByUID(userUID);
    return userModel.userProfilePhoto;
  }

//? sign in google account to get it's information
  Future<GoogleSignInAccount?> googleSignIn() async {
    //* here just sign up with google
    final GoogleSignInAccount? googleSignInAccount = await _google.signIn();

    return googleSignInAccount;
  }

//? sign in google account to firebase to add it to firebase auth
  Future<User?> firebaseSignInGoogle(
    GoogleSignInAccount googleSignInAccount,
  ) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    //* here the user chose an account
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    UserCredential result = await auth.signInWithCredential(authCredential);
    return result.user;
  }

//? sign up with email and password
  Future<User?> firebaseSignUpEmailPassword(
    String email,
    String password,
  ) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  //? logout google
  Future<void> logOutGoogle() async {
    try {
      await _google.signOut();
      await _google.disconnect();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    await FirebaseAuth.instance.signOut();
  }
}
