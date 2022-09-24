// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/full_post.dart';
import 'package:project/screens/testing_screen/widgets/list_loader.dart';

class ListLoadingScreen extends StatefulWidget {
  static const String routeName = '/list-loading-screen';
  const ListLoadingScreen({super.key});

  @override
  State<ListLoadingScreen> createState() => _ListLoadingScreenState();
}

class _ListLoadingScreenState extends State<ListLoadingScreen> {
  List<ProductModel> products = [...dc.fProducts];
  FirebaseFirestore ref = FirebaseFirestore.instance;
  int ms = 0;
  bool loading = true;

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    DateTime before = DateTime.now();
    var res = await ref.collection(smallProductsCollectionName).limit(5).get();
    List<ProductModel> ps = [];
    for (var element in res.docs) {
      var p = ProductModel.fromJSON(element.data());
      ps.add(p);
    }

    DateTime after = DateTime.now();
    setState(() {
      loading = false;
      products = ps;
      ms = after.difference(before).inMilliseconds;
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
                  Text(
                      'Loaded ${products.length.toString()} Products Took $ms ms'),
                  Expanded(
                    child: ListLoader(
                      itemCount: products.length,
                      itemBuilder: (context, index) => FullPost(
                        fullPostModel: products[index],
                      ),
                      children: products
                          .map((e) => FullPost(fullPostModel: e))
                          .toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: fetchData,
                        child: Text('Get Products'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HolderScreen.routeName);
                        },
                        child: Text('Go Home'),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
