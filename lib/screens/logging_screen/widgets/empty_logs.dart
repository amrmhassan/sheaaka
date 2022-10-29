// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EmptyLogs extends StatelessWidget {
  const EmptyLogs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Logs are empty '),
    );
  }
}
