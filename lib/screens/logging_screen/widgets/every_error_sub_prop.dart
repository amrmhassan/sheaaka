import 'package:flutter/material.dart';
import 'package:project/models/error_logger_model.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/logging_screen/widgets/local_models.dart';

class EveryErrorSubProp extends StatelessWidget {
  final ExpandedItem expandedItem;
  final Function(int index, bool isExpanded) expansionCallback;
  const EveryErrorSubProp({
    super.key,
    required this.expandedItem,
    required this.expansionCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: expansionCallback,
      children: [
        ...expandedItem.props.map(
          (mainsItems) => ExpansionPanel(
            backgroundColor:
                Color.fromARGB(255, 216, 216, 216).withOpacity(.01),
            canTapOnHeader: true,
            isExpanded: mainsItems.isExpanded,
            headerBuilder: (context, isExpanded) =>
                ListTile(title: Text(mainsItems.title)),
            body: PaddingWrapper(
              child: Text(
                getContentFromMainsCode(
                    mainsItems.code, expandedItem.errorLoggerModel),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getContentFromMainsCode(
      String code, ErrorLoggerModel errorLoggerModel) {
    if (code == 'rm') {
      return errorLoggerModel.message;
    } else if (code == 'em') {
      return errorLoggerModel.error;
    } else {
      return errorLoggerModel.stackTrace;
    }
  }
}
