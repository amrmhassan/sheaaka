import 'package:flutter/material.dart';
import 'package:project/screens/logging_screen/sqlite_logging_screen.dart';

class OpenLoggingScreen extends StatelessWidget {
  const OpenLoggingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SqliteLoggingScreen.routeName);
      },
      child: Container(
        width: 20,
        height: 100,
        color: Colors.transparent,
      ),
    );
  }
}
