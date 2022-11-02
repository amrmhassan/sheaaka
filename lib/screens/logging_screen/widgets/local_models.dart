import 'package:project/models/error_logger_model.dart';

enum Code {
  readableMessage,
  errorMessage,
  stackTrace,
  errorDate,
}

class ErrorLogModelProps {
  final Code code;
  final String title;
  bool isExpanded;
  ErrorLogModelProps({
    required this.code,
    required this.title,
    this.isExpanded = false,
  });
}

class ExpandedItem {
  final ErrorLoggerModel errorLoggerModel;
  late List<ErrorLogModelProps> props;
  bool isExpanded;

  ExpandedItem({
    required this.errorLoggerModel,
    this.isExpanded = false,
  }) {
    props = [
      ErrorLogModelProps(title: 'Error Date', code: Code.errorDate),
      ErrorLogModelProps(title: 'Error Message', code: Code.errorMessage),
      ErrorLogModelProps(title: 'Stack Trace', code: Code.stackTrace),
    ];
  }
}
