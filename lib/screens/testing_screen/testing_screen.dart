// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            VSpace(),
            Image.network(
              'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  if (loadingProgress.cumulativeBytesLoaded <
                      loadingProgress.expectedTotalBytes!) {
                    return Text('data');
                  } else {
                    return child;
                  }
                }

                return child;
              },
              width: double.infinity,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
