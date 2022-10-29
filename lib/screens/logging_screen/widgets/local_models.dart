import 'package:project/models/error_logger_model.dart';

class ErrorLogModelProps {
  final String code;
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
      ErrorLogModelProps(title: 'Readable Message', code: 'rm'),
      ErrorLogModelProps(title: 'Error Message', code: 'em'),
      ErrorLogModelProps(title: 'Stack Trace', code: 'st'),
    ];
  }
}
