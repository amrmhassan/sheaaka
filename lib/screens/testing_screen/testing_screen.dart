// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/borders.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        alignment: Alignment.center,
        child: DottedBorder(
          borderType: BorderType.Circle,
          color: Colors.red,
          padding: EdgeInsets.zero,
          strokeWidth: 8,
          dashPattern: getPattern(.75, 100),
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
              ),
              child: Image.asset(
                'assets/images/3.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
