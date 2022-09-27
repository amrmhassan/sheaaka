// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/constants/types.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/loading.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/home_screen/widgets/full_post.dart';
import 'package:project/screens/home_screen/widgets/open_search_box.dart';
import 'package:project/screens/search_screen/search_screen.dart';
import 'package:project/screens/testing_screen/widgets/list_loader/list_loader.dart';
import 'package:provider/provider.dart';

//? this screen will have the newest products, offers , ads etc...
//? and it's filters will be applied to these products

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);
    var homeProducts = productsProvider.homeProducts;
    var wishlistProvider = Provider.of<WishListsProvider>(context);

    return productsProvider.loadingHomeProducts
        ? Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Loading(
              title: 'جاري تحميل أحدث المنتجات',
            ),
          )
        : Column(
            children: [
              VSpace(),
              OpenSearchBox(
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.routeName,
                      arguments: SearchTypes.product);
                },
              ),
              VSpace(),
              HLine(),
              Expanded(
                child: ListLoader(
                  loadingNewAfterPixels: 0,
                  onReload: () {
                    productsProvider.reloadHomeProducts();
                  },
                  onLoadNew: () {
                    productsProvider.getNextHomeProducts();
                  },
                  padding: EdgeInsets.only(bottom: kVPad / 2),
                  itemCount: homeProducts.length,
                  itemBuilder: (context, index) {
                    ProductModel p = homeProducts[index];
                    return FullPost(
                      fullPostModel: p,
                      wishlistItemId:
                          wishlistProvider.getWishlistItemByProductId(p.id)?.id,
                    );
                  },
                  showBottomLoader: false,
                ),
              ),
              if (productsProvider.loadingNextHomeProducts)
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: kVPad / 2),
                  width: double.infinity,
                  child: Text(
                    'جاري التحميل',
                    style: h3InactiveTextStyle,
                  ),
                )
            ],
          );
  }
}
