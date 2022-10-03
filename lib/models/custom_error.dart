import 'package:project/constants/errors_constants.dart';

//! handle the errors to let known and unknown errors appear in the debugging mode
//! but let only known errors to appear in the production mode

class CustomError implements Exception {
  ErrorsTypes errorType;
  StackTrace? stackTrace;

  CustomError(this.errorType, [this.stackTrace]);

  @override
  String toString() {
    return errorMessage(errorType);
  }
}
