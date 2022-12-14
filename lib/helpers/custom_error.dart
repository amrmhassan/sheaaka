import 'package:flutter/foundation.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/helpers/logger.dart';

//! handle the errors to let known and unknown errors appear in the debugging mode
//! but let only known errors to appear in the production mode

class CustomError implements Exception {
  ErrorsTypes? errorType;
  StackTrace? stackTrace;
  Object? errString;
  bool? rethrowError;

  CustomError({
    this.errorType,
    this.stackTrace,
    this.errString,
    this.rethrowError,
  }) {
    if (rethrowError != null && rethrowError == true) {
      throw Exception(toString());
    }
    if (kDebugMode) {
      print(errorType);
      print(errString);
      print(stackTrace);
    }

    logger.e(
      readableErrorMessage(),
      errString,
      stackTrace,
    );
  }

  String readableErrorMessage() {
    return errorMessage(errorType);
  }

  @override
  String toString() {
    if (errorType == null && errString == null) {
      throw Exception('Error type or error message should be givin');
    } else if (errorType != null) {
      return errorMessage(errorType!);
    } else {
      return errString.toString();
    }
  }
}
