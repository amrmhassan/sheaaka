import 'package:firebase_auth/firebase_auth.dart';

String getReadableErrorMessage(FirebaseAuthException error) {
  String readableError = 'حدث خطأ';
  //? log in errors
  // wrong- password  ==> email is wrong
  if (error.code == 'wrong-password') {
    readableError = 'بيانات المستخدم غير صحيحة';
  }
  // user-not-found  ==> email is wrong
  else if (error.code == 'user-not-found') {
    readableError = 'هذا الايميل غير مسجل';
  }
  //? sign up errors
  // email-already-in-use ==> email already exists
  else if (error.code == 'email-already-in-use') {
    readableError = 'هذا الايميل موجود بالفعل';
  } else if (error.code == 'too-many-requests') {
    readableError = 'لقد تجاوزت الحد الأقصي  لمحاولات تسجيل الدخول, حاول لاحقا';
  }

  return readableError;
}
