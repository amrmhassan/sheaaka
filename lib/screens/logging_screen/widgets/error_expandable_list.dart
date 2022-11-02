// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/logging_screen/widgets/every_error_sub_prop.dart';
import 'package:project/screens/logging_screen/widgets/local_models.dart';

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
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: widget.expansionCallBackParent,
      children: [
        ...widget.expandedItems.map(
          (e) => ExpansionPanel(
            isExpanded: e.isExpanded,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => ListTile(
              tileColor: Color.fromARGB(255, 216, 216, 216).withOpacity(.5),
              title: Text(e.errorLoggerModel.message),
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
