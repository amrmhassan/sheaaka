// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/locations.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/open_search_box.dart';
import 'package:project/screens/nearby_stores_screen/widgets/store_full_post.dart';
import 'package:provider/provider.dart';

class NearbyStoresScreen extends StatefulWidget {
  const NearbyStoresScreen({Key? key}) : super(key: key);

  @override
  State<NearbyStoresScreen> createState() => _NearbyStoresScreenState();
}

class _NearbyStoresScreenState extends State<NearbyStoresScreen> {
  LatLng? location = myLocation;
  ScrollController scrollController = ScrollController();
  bool mapsButtonActive = true;
  double currentScrollPosition = 0;
  @override
  void initState() {
    scrollController.addListener(() {
      double s = scrollController.position.extentAfter;

      if (s > currentScrollPosition && !mapsButtonActive) {
        //? scrolling down
        setState(() {
          mapsButtonActive = true;
        });
      } else if (s < currentScrollPosition && mapsButtonActive) {
        setState(() {
          mapsButtonActive = false;
        });
      }
      currentScrollPosition = s;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var storesProvider = Provider.of<StoreProvider>(context);
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          VSpace(factor: 2),
          OpenSearchBox(),
          VSpace(),
          location == null
              ? Container(
                  child: Text(
                    'لابد من تحديد موقعك لاسنخدام هذه الخاصية',
                    style: h4TextStyleInactive,
                  ),
                )
              : Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: scrollController,
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: List.generate(
                            storesProvider.stores.length,
                            (index) => StoreFullPost(
                              storeModel: storesProvider.stores[index],
                              myLocation: location!,
                            ),
                          ),
                        ),
                      ),
                      OpenStoresMapButton(active: mapsButtonActive),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class OpenStoresMapButton extends StatelessWidget {
  final bool active;
  const OpenStoresMapButton({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return active
        ? Positioned(
            bottom: kVPad,
            right: kHPad,
            child: ButtonWrapper(
              padding: EdgeInsets.all(largePadding),
              onTap: () {},
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: kLightColor,
                boxShadow: [defaultBoxShadow],
              ),
              child: Image.asset(
                'assets/icons/map1.png',
              ),
            ),
          )
        : SizedBox();
  }
}
