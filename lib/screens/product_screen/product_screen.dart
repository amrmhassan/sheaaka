// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/loading.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/home_screen/widgets/full_post_images.dart';
import 'package:project/screens/home_screen/widgets/image_slider_dots_container.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/widgets/add_to_cart_button.dart';
import 'package:project/screens/product_screen/widgets/open_product_comments_button.dart';
import 'package:project/screens/product_screen/widgets/product_description_text.dart';
import 'package:project/screens/product_screen/widgets/product_name.dart';
import 'package:project/screens/product_screen/widgets/product_screen_app_bar.dart';
import 'package:project/screens/product_screen/widgets/product_size_color.dart';
import 'package:project/screens/product_screen/widgets/product_suggestion_card.dart';
import 'package:project/utils/screens_utils/product_screen_utils.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/product-screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int activeDot = 0;
  bool _loadingProduct = true;
  late ProductModel productModel;
  late bool addedToCart;
  String? wishlistItemId;
  final ScrollController _scrollController = ScrollController();

  // int? activeSizeIndex = 0;
  // int? activeColorIndex = 0;
  void setActiveDot(int i) {
    setState(() {
      activeDot = i;
    });
  }

  Future<void> fetchProduct(String productModelId) async {
    setState(() {
      _loadingProduct = true;
    });
    var p = await Provider.of<ProductsProvider>(context, listen: false)
        .findProductById(productModelId);
    setState(() {
      productModel = p;
      _loadingProduct = false;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) {
        final productModelId =
            ModalRoute.of(context)!.settings.arguments as String;
        fetchProduct(productModelId);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductsProvider>(context);
    var wishlistProvider = Provider.of<WishListsProvider>(context);

    try {
      var cartProvider = Provider.of<CartProvider>(context);
      addedToCart = cartProvider.productAddedToCart(productModel.id);
      wishlistItemId =
          wishlistProvider.getWishlistItemByProductId(productModel.id)?.id;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return ScreensWrapper(
      child: _loadingProduct
          ? Column(
              children: [
                ProductScreenAppBar(
                  id: '',
                  loading: _loadingProduct,
                  wishlistItemId: wishlistItemId,
                ),
                Expanded(
                  child: Loading(
                    title: 'تحميل معلومات المنتج',
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            FullPostImage(
                                imagesPath: productModel.imagesPath,
                                setActiveDot: setActiveDot),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductScreenAppBar(
                                  id: productModel.id,
                                  loading: _loadingProduct,
                                  wishlistItemId: wishlistItemId,
                                ),
                              ],
                            ),
                            handleShowBrand(productModel),
                          ],
                        ),
                        VSpace(factor: .5),
                        ImageSliderDotsContainer(
                          activeDot: activeDot,
                          count: productModel.imagesPath.length,
                        ),
                        VSpace(factor: .5),
                        PaddingWrapper(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //? this row is for the name, price
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ProductName(
                                    name: productModel.name,
                                  ),
                                  Spacer(),
                                  handleShowOldPrice(productModel),
                                  HSpace(factor: .3),
                                  ProductCartPrice(
                                    fontWeight: FontWeight.bold,
                                    fontSize: h2TextSize,
                                    price: productModel.price,
                                  ),
                                ],
                              ),
                              //? this row is for remaining in stock, rating, number of comments
                              handleSecondaryProductInfo(productModel),
                              VSpace(factor: .5),
                              ProductDescriptionText(
                                desc: productModel.fullDesc ?? 'لا يوجد وصف',
                              ),
                              VSpace(factor: .5),
                              productModel.remainingNumber != null &&
                                      productModel.remainingNumber! < 1
                                  ? SizedBox()
                                  : ProductSizeColor(
                                      productModel: productModel),
                            ],
                          ),
                        ),
                        HLine(),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(
                            horizontal: kHPad,
                            vertical: kVPad / 2,
                          ),
                          child: Text(
                            'الاقتراحات',
                            style: h2TextStyle,
                          ),
                        ),
                        GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: kHPad / 2,
                            mainAxisSpacing: kVPad / 2,
                          ),
                          itemBuilder: (context, index) {
                            ProductModel p =
                                productProvider.homeProducts[index];
                            return ProductSuggestionCard(
                              imagePath: p.imagesPath[0],
                              productId: p.id,
                              price: p.price,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kHPad,
                    vertical: kVPad / 2,
                  ),
                  child: Row(
                    children: [
                      AddToCartButton(
                        productModel: productModel,
                        active: addToCartActiveButton(
                                productModel.remainingNumber) &&
                            !addedToCart,
                        title: addedToCart ? 'موجود في السلة' : null,
                      ),
                      HSpace(factor: .5),
                      OpenProductCommentsButton(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
