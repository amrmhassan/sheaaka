// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/product_constants.dart';

const double maxLoaderRadius = 100;
const double radiusFactor = 2;

const double maxMargin = 1000;
const double marginFactor = 5;

const rotationSpeedFactor = 100;

class TestingScreen extends StatefulWidget {
  static String routeName = '/testing-screen';

  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: productColors
            .map((e) => Container(
                  width: double.infinity,
                  height: 50,
                  color: e,
                ))
            .toList(),
      ),
    );
  }
}
