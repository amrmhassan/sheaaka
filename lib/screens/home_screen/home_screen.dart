// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/empty_widget.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/shimmer_loaders/post_simmer_loading/post_shimmer_loading.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/home_screen/widgets/full_post.dart';
import 'package:project/screens/home_screen/widgets/open_search_box.dart';
import 'package:project/screens/search_screen/search_screen.dart';
import 'package:project/screens/testing_screen/widgets/list_loader/list_loader.dart';
import 'package:project/utils/holder_screen_utils.dart';
import 'package:provider/provider.dart';

//? this screen will have the newest products, offers , ads etc...
//? and it's filters will be applied to these products

class HomeScreen extends StatefulWidget {
  final bool loadingData;
  const HomeScreen({
    Key? key,
    required this.loadingData,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool localLoading = false;
  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);
    var allProducts = productsProvider.allProducts;
    var wishlistProvider = Provider.of<WishListsProvider>(context);

    return Column(
      children: [
        VSpace(),
        OpenSearchBox(
          onTap: () {
            Navigator.pushNamed(context, SearchScreen.routeName,
                arguments: {'searchType': SearchTypes.product});
          },
        ),
        VSpace(),
        HLine(),
        (widget.loadingData || localLoading)
            ? Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    PostSimmerLoading(),
                    PostSimmerLoading(),
                    PostSimmerLoading(),
                  ],
                ),
              )
            : allProducts.isEmpty
                ? Expanded(
                    child: EmptyWidget(
                      title: 'لا توجد منتجات بعد',
                    ),
                  )
                : Expanded(
                    child: ListLoader(
                      loadingNewAfterPixels: 0,
                      onReload: () async {
                        setState(() {
                          localLoading = true;
                        });
                        await loadDataForHomeScreen(context);
                        setState(() {
                          localLoading = false;
                        });
                      },
                      onLoadNew: () {
                        // productsProvider.getNextHomeProducts();
                      },
                      padding: EdgeInsets.only(bottom: kVPad / 2),
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        ProductModel p = allProducts[index];
                        return FullPost(
                          fullPostModel: p,
                          wishlistItemId: wishlistProvider
                              .getWishlistItemByProductId(p.id)
                              ?.id,
                        );
                      },
                      showBottomLoader: false,
                    ),
                  ),
        // if (productsProvider.loadingNextHomeProducts)
        // Container(
        //   alignment: Alignment.center,
        //   padding: EdgeInsets.symmetric(vertical: kVPad / 2),
        //   width: double.infinity,
        //   child: Text(
        //     'جاري التحميل',
        //     style: h3InactiveTextStyle,
        //   ),
        // )
      ],
    );
  }
}
