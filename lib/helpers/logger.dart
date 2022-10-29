// ignore_for_file: prefer_function_declarations_over_variables, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project/constants/db_constants.dart';
import 'package:project/constants/global.dart';
import 'package:project/helpers/db_helper.dart';
import 'package:project/models/error_logger_model.dart';
import 'package:uuid/uuid.dart';

final logger = Logger(
  printer: CustomPrinter(),
  output: FileOutPut(),
);

class CustomPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final message = event.message.toString();
    final error = event.error.toString();
    final stack = event.stackTrace.toString();

    return [
      message,
      error,
      stack.toString(),
      DateTime.now().toString(),
    ];
    // return [
    //   'Message : ',
    //   message,
    //   '\n',
    //   'Stack Trace : ',
    //   stack.toString(),
    //   '\n',
    //   'Date',
    //   DateTime.now().toString(),
    //   '\n',
    //   '*****---------------------------*****',
    //   '\n'
    // ];
  }
}

class FileOutPut extends LogOutput {
  //? logging to a file
  Future<void> loggingToFile(OutputEvent event) async {
    try {
      String path = (await getApplicationDocumentsDirectory()).path;
      String fullPath = '$path/$loggingFileName';

      File logFile = File(fullPath);
      if (!logFile.existsSync()) {
        await logFile.create();
      }

      for (var line in event.lines) {
        await logFile.writeAsString(line,
            mode: FileMode.append,
            encoding: Encoding.getByName('utf-8') as Encoding);
      }
    } catch (error) {
      // CustomError.log(error: error, stackTrace: stackTrace);
      //* i can't run the previous line cause it will make an infinite loop
      if (kDebugMode) {
        // print(error);
        // print(stack);
      }
    }
  }

  //? log to sqlite
  Future<void> logToSqlite(OutputEvent event) async {
    try {
      List<String> lines = event.lines;
      String id = Uuid().v4();
      ErrorLoggerModel errorLoggerModel = ErrorLoggerModel(
        id: id,
        message: lines[0],
        error: lines[1],
        stackTrace: lines[2],
        date: lines[3],
      );
      await DBHelper.insert(
        errorsLoggerTableName,
        errorLoggerModel.toJSON(),
      );
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
  }

  @override
  void output(OutputEvent event) async {
    await loggingToFile(event);
    await logToSqlite(event);
  }
}
