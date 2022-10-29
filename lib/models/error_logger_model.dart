import 'package:project/constants/db_constants.dart';
import 'package:project/constants/models_constants.dart';

class ErrorLoggerModel {
  final String id;
  final String message;
  final String error;
  final String stackTrace;
  final String date;

  const ErrorLoggerModel({
    required this.id,
    required this.message,
    required this.error,
    required this.stackTrace,
    required this.date,
  });

  Map<String, String> toJSON() {
    return {
      idString: id,
      messageString: message,
      errorString: error,
      stackTraceString: stackTrace,
      dateString: date,
    };
  }

  static ErrorLoggerModel fromJSON(Map<String, dynamic> errorJSON) {
    String id = errorJSON[idString] as String;
    String message = errorJSON[messageString]!.toString();
    String error = errorJSON[errorString]!.toString();
    String stackTrace = errorJSON[stackTraceString]!.toString();
    String date = errorJSON[dateString]!.toString();
    return ErrorLoggerModel(
      id: id,
      message: message,
      error: error,
      stackTrace: stackTrace,
      date: date,
    );
  }

  static String toSqliteString() {
    return 'CREATE TABLE $errorsLoggerTableName ($idString TEXT PRIMARY KEY, $messageString TEXT, $errorString TEXT, $stackTraceString TEXT, $dateString TEXT)';
  }
}
