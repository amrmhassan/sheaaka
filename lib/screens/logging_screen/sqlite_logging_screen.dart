// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:project/constants/db_constants.dart';
import 'package:project/constants/styles.dart';
import 'package:project/helpers/db_helper.dart';
import 'package:project/models/error_logger_model.dart';
import 'package:project/utils/general_utils.dart';

class ExpandedItem {
  final ErrorLoggerModel errorLoggerModel;
  bool isExpanded;

  ExpandedItem({
    required this.errorLoggerModel,
    this.isExpanded = false,
  });
}

class SqliteLoggingScreen extends StatefulWidget {
  static const String routeName = '/sqlite-logging-screen';
  const SqliteLoggingScreen({Key? key}) : super(key: key);

  @override
  State<SqliteLoggingScreen> createState() => _LoggingScreenState();
}

class _LoggingScreenState extends State<SqliteLoggingScreen> {
  bool _loading = false;
  List<ExpandedItem> expandedItems = [];
  int timesDeleteClicked = 0;

  //? loading the data from the sqlite
  Future<void> loadLogs() async {
    setState(() {
      _loading = true;
    });
    var data = await DBHelper.getData(errorsLoggerTableName);

    for (var element in data) {
      ExpandedItem errorLoggerModel = ExpandedItem(
        errorLoggerModel: ErrorLoggerModel.fromJSON(element),
      );
      expandedItems.add(errorLoggerModel);
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    loadLogs();
    super.initState();
  }

  Future<void> deleteLogs() async {
    //? the user needs to click the delete button 3 times before actually deleting the logs file
    if (timesDeleteClicked < 2) {
      timesDeleteClicked++;
      showSnackBar(
        context: context,
        message: 'Remaining ${3 - timesDeleteClicked} Clicks to delete!',
      );
      return;
    }
    //! here delete the db
    await DBHelper.deleteTable(errorsLoggerTableName);
    setState(() {
      _loading = false;
      expandedItems.clear();
    });
    timesDeleteClicked = 0;
    showSnackBar(
      context: context,
      message: 'Logs deleted successfully',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Logs'),
        actions: [
          IconButton(
            onPressed: deleteLogs,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              showSnackBar(
                context: context,
                message: 'Exporting the logs (coming soon)',
              );
            },
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _loading
          ? Text('Loading')
          : expandedItems.isEmpty
              ? Center(
                  child: Text('Logs are empty '),
                )
              : SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Container(
                      child: ExpansionPanelList(
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            expandedItems[panelIndex].isExpanded = !isExpanded;
                          });
                        },
                        children: expandedItems
                            .map(
                              (e) => ExpansionPanel(
                                headerBuilder: (context, isExpanded) =>
                                    ListTile(
                                  title: Text(
                                    e.errorLoggerModel.message,
                                    style: h3LiteTextStyle,
                                  ),
                                ),
                                body: Text(e.errorLoggerModel.stackTrace),
                                isExpanded: e.isExpanded,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
    );
  }
}
