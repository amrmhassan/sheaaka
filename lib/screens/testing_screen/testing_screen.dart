// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';

const double maxLoaderRadius = 100;
const double radiusFactor = 2;

const double maxMargin = 1000;
const double marginFactor = 5;

const rotationSpeedFactor = 100;

class Friend {
  final String name;
  final int age;
  final DateTime birth;

  const Friend({
    required this.age,
    required this.name,
    required this.birth,
  });
}

class TestingScreen extends StatefulWidget {
  static String routeName = '/testing-screen';

  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  void initState() {
    Friend f = Friend(
        age: 20,
        name: 'osama',
        birth: DateTime.now().subtract(Duration(days: 14 * 365)));

    FirebaseFirestore.instance
        .collection('TestingCollection')
        .add({'dasta': f});

    super.initState();
  }

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
