import 'package:project/constants/errors_constants.dart';

class CustomError implements Exception {
  ErrorsTypes errorType;
  StackTrace? stackTrace;

  CustomError(this.errorType, [this.stackTrace]);

  @override
  String toString() {
    return errorMessage(errorType);
  }
}
