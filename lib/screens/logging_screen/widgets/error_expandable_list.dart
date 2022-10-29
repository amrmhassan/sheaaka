import 'package:flutter/material.dart';
import 'package:project/screens/logging_screen/widgets/every_error_sub_prop.dart';
import 'package:project/screens/logging_screen/widgets/local_models.dart';
import 'package:project/utils/general_utils.dart';

class ErrorExpandableList extends StatefulWidget {
  final Function(int index, bool isExpanded) expansionCallBackParent;
  final List<ExpandedItem> expandedItems;
  const ErrorExpandableList({
    super.key,
    required this.expansionCallBackParent,
    required this.expandedItems,
  });

  @override
  State<ErrorExpandableList> createState() => _ErrorExpandableListState();
}

class _ErrorExpandableListState extends State<ErrorExpandableList> {
  List<ErrorLogModelProps> errorLogModelProps = [];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: widget.expansionCallBackParent,
      children: [
        ...widget.expandedItems.map(
          (e) => ExpansionPanel(
            isExpanded: e.isExpanded,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => ListTile(
              title: Text(
                dateToString(
                  DateTime.parse(e.errorLoggerModel.date),
                ),
              ),
            ),
            body: EveryErrorSubProp(
              expandedItem: e,
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  e.props[panelIndex].isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
