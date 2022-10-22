import 'package:flutter/foundation.dart';
import 'package:project/constants/errors_constants.dart';

//! handle the errors to let known and unknown errors appear in the debugging mode
//! but let only known errors to appear in the production mode

class CustomError implements Exception {
  ErrorsTypes? errorType;
  StackTrace? stackTrace;
  String? errString;
  bool? rethrowError;

  CustomError({
    this.errorType,
    this.stackTrace,
    this.errString,
    this.rethrowError,
  }) {
    if (kDebugMode) {
      // print('Error Message : $errString');
      // print(toString());
      // print(stackTrace);
    }
    if (rethrowError != null && rethrowError == true) {
      throw Exception(toString());
    }
  }

  @override
  String toString() {
    if (errorType == null && errString == null) {
      throw Exception('Error type or error message should be givin');
    } else if (errorType != null) {
      return errorMessage(errorType!);
    } else {
      return errString!;
    }
  }
}
