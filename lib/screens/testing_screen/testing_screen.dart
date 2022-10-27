// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';

class TestingScreen extends StatelessWidget {
  static String routeName = '/testing-screen';

  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            VSpace(),
            ElevatedButton(
              onPressed: () async {},
              child: Text('Print'),
            ),
          ],
        ),
      ),
    );
  }
}
