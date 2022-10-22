// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/home_screen/widgets/full_post.dart';

class LoadingProductsScreen extends StatefulWidget {
  static String routeName = '/loading-products-screen';
  const LoadingProductsScreen({super.key});

  @override
  State<LoadingProductsScreen> createState() => _LoadingProductsScreenState();
}

class _LoadingProductsScreenState extends State<LoadingProductsScreen> {
  List<ProductModel> products = [];
  FirebaseFirestore ref = FirebaseFirestore.instance;
  int ms = 0;
  bool loading = true;

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    DateTime before = DateTime.now();
    var res = await ref.collection(productsCollectionName).get();
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
                      '${products.length.toString()} Products Loaded Took $ms ms'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: ((context, index) => FullPost(
                            fullPostModel: products[index],
                            wishlistItemId: null,
                          )),
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
                        onPressed: () {},
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
