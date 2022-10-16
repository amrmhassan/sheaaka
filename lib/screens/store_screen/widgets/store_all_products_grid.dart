// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/empty_widget.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:provider/provider.dart';

class StoreAllProductsGrid extends StatefulWidget {
  final StoreTabModel storeActiveTab;
  final String storeId;

  const StoreAllProductsGrid({
    Key? key,
    required this.storeActiveTab,
    required this.storeId,
  }) : super(key: key);

  @override
  State<StoreAllProductsGrid> createState() => _StoreAllProductsGridState();
}

class _StoreAllProductsGridState extends State<StoreAllProductsGrid> {
  bool loading = false;
  List<ProductModel> storeProducts = [];

  Future<void> fetchStoreProducts() async {
    setState(() {
      loading = true;
    });
    List<ProductModel> p;
    if (widget.storeActiveTab.allProducts) {
      p = Provider.of<ProductsProvider>(context, listen: false)
          .getStoreProducts(widget.storeId);
    } else {
      p = Provider.of<ProductsProvider>(context, listen: false)
          .getStoreTabProducts(widget.storeActiveTab, widget.storeId);
    }

    setState(() {
      storeProducts = p;
      loading = false;
    });
  }

  @override
  void initState() {
    fetchStoreProducts();
    super.initState();
  }

//? to change the viewed products when the active tab changes
  @override
  void didUpdateWidget(covariant StoreAllProductsGrid oldWidget) {
    if (oldWidget.storeActiveTab != widget.storeActiveTab) {
      fetchStoreProducts();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    //! make the taps to float in the of the screen when reaching the top while scrolling

    return loading
        ? Text('Loading')
        : storeProducts.isEmpty
            ? Column(
                children: [
                  VSpace(factor: 2),
                  EmptyWidget(
                    title: widget.storeActiveTab.allProducts
                        ? 'لا يوجد منتجات في هذا المحل'
                        : 'لا يوجد منتجات في هذا القسم',
                  ),
                ],
              )
            : GridView.count(
                // padding: EdgeInsets.symmetric(vertical: kVPad),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: List.generate(
                  storeProducts.length,
                  (index) => StoreProductCardSquare(
                    imagePath: storeProducts[index].imagesPath[0],
                    productId: storeProducts[index].id,
                  ),
                ),
              );
  }
}

class StoreProductCardSquare extends StatelessWidget {
  final String productId;
  final String imagePath;
  const StoreProductCardSquare({
    Key? key,
    required this.productId,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: productId,
        );
      },
      child: Image.network(
        imagePath,
        width: double.infinity,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      ),
    );
  }
}
