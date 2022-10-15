// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  // void initState() {
  //   Friend f = Friend(
  //       age: 20,
  //       name: 'osama',
  //       birth: DateTime.now().subtract(Duration(days: 14 * 365)));

  //   FirebaseFirestore.instance
  //       .collection('TestingCollection')
  //       .add({'dasta': f});

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            VSpace(),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: FadeInImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg',
                ),
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: AssetImage(
                  'assets/images/placeholder.png',
                ),
                placeholderFit: BoxFit.cover,
              ),
            )
            // Container(
            //   width: 200,
            //   height: 200,
            //   child: LoadingImage(),
            // ),
          ],
        ),
      ),
    );
  }
}
