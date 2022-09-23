// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/home_screen/widgets/full_post.dart';

class TestingScreen extends StatefulWidget {
  static String routeName = '/testing-screen';
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  List<ProductModel> products = [...dc.fProducts];
  FirebaseFirestore ref = FirebaseFirestore.instance;
  bool loading = true;

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    var res = await ref.collection(productsCollectionName).get();
    List<ProductModel> ps = [];
    for (var element in res.docs) {
      var p = ProductModel.fromJSON(element.data());
      ps.add(p);
    }

    setState(() {
      loading = false;
      products = ps;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loading
            ? Text('Loading')
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: ((context, index) => FullPost(
                            fullPostModel: products[index],
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: fetchData,
                        child: Text('Get Products'),
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
