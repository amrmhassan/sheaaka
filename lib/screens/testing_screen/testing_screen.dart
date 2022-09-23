// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/helpers/data_creator.dart';

class TestingScreen extends StatefulWidget {
  static String routeName = '/testing-screen';
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  bool uploading = false;
  var ref = FirebaseFirestore.instance;
  String dataLength = '';
  @override
  Widget build(BuildContext context) {
    Future<void> createDataFireStore() async {
      setState(() {
        uploading = true;
      });

      for (var p in dc.fProducts) {
        await ref.collection(productsCollectionName).doc(p.id).set(p.toJSON());
      }

      setState(() {
        uploading = false;
      });
    }

    Future<void> getData() async {
      setState(() {
        uploading = true;
      });
      var res = await ref.collection(productsCollectionName).get();

      setState(() {
        dataLength = res.docs.length.toString();
        uploading = false;
      });
    }

    int value = Colors.red.value;
    Color color = Color(value);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: color,
              child: Text(uploading ? 'Uploading' : ''),
            ),
            if (dataLength.isNotEmpty)
              Container(
                color: Colors.red,
                child: Text('There is $dataLength products in the cloud'),
              ),
            ElevatedButton(
              onPressed: () {
                createDataFireStore();
              },
              child: Text('Upload'),
            ),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: Text('Get Data'),
            ),
          ],
        ),
      ),
    );
  }
}
