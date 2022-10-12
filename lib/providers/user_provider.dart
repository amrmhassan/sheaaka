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
import 'package:uuid/uuid.dart';

class UserProvider extends ChangeNotifier {
  final GoogleSignIn _google = GoogleSignIn();
  //! i might need to use these props, and set their values once the app is initiated
  User? user;
  UserModel? userModel;

  //? creating user store warning
  bool userStoreWarning = false;

  void setUserStoreWarning(bool v) {
    userStoreWarning = v;
    notifyListeners();
  }

//? setting user data
  void setCurrentUserData(User? u, UserModel? uM, [bool notify = false]) {
    user = u;
    userModel = uM;
    if (notify) notifyListeners();
  }

//? get user data by his uid
  Future<UserModel> getUserDataByUID(String userUID) async {
    DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
        .instance
        .collection(usersCollectionName)
        .doc(userUID)
        .get();

    UserModel userModel =
        UserModel.fromJSON(userData.data() as Map<String, dynamic>);
    return userModel;
  }

//? get user data by email
  Future<UserModel?> getUserDataByEmail(String email) async {
    var data = await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .where(emailString, isEqualTo: email)
        .get();
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

  //? check if show the open store button
  bool get showOpenStoreButton {
    if (userModel != null) {
      if ((userModel!.userRole == UserRole.trader) && !userStoreWarning) {
        return true;
      }
    }
    return false;
  }

  //# authenticating users

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
      // setCurrentUserData(user, newUser);
    } else {
      throw CustomError(errorType: ErrorsTypes.unknownError);
    }
  }

//? login user with email password
  Future<void> loginEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
    required Future<void> Function() fetchAndUpdateFavoriteProducts,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // User? u = userCredential.user;
    // if (u != null) {
    //   UserModel userModel = await getUserDataByUID(u.uid);
    //   setCurrentUserData(u, userModel);
    // }
    await fetchAndUpdateFavoriteProducts();
  }

//? sign in google account to get it's information
  Future<GoogleSignInAccount?> googleSignIn() async {
    final GoogleSignInAccount? googleSignInAccount;
    try {
      //* here just sign up with google
      googleSignInAccount = await _google.signIn();
    } catch (e, s) {
      throw CustomError(errorType: ErrorsTypes.cantGoogleSignIn, stackTrace: s);
    }

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
    // if (credential.user != null) {
    //   UserModel userModel = await getUserDataByUID(credential.user!.uid);
    //   setCurrentUserData(credential.user!, userModel);
    // }
    return credential.user;
  }

  //? logout google
  Future<void> logOutGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _google.signOut();
      await _google.disconnect();
    } catch (e, s) {
      CustomError(errorType: ErrorsTypes.cantSignOut, stackTrace: s);
    }
  }
}
