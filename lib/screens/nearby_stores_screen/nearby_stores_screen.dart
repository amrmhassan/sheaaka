// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:project/global/widgets/empty_widget.dart';
import 'package:project/global/widgets/loading.dart';

import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/location_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/open_search_box.dart';
import 'package:project/screens/nearby_stores_screen/widgets/nearby_stores_no_location.dart';
import 'package:project/screens/nearby_stores_screen/widgets/open_stores_map_button.dart';
import 'package:project/screens/nearby_stores_screen/widgets/store_full_post.dart';
import 'package:project/screens/search_screen/search_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class NearbyStoresScreen extends StatefulWidget {
  const NearbyStoresScreen({Key? key}) : super(key: key);

  @override
  State<NearbyStoresScreen> createState() => _NearbyStoresScreenState();
}

class _NearbyStoresScreenState extends State<NearbyStoresScreen> {
  LocationData? locationData;
  bool _loadingLocation = false;

  ScrollController scrollController = ScrollController();
  bool mapsButtonActive = true;
  double currentScrollPosition = 0;

//? handling the map icon with scrolling
  void addScrollListener() {
    scrollController.addListener(() {
      double s = scrollController.position.extentAfter;
      double i = scrollController.position.extentBefore;

      if (i < Responsive.getHeight(context) / 2) return;
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
  }

//? for loading the user location
  Future<void> loadLocation() async {
    var lData =
        Provider.of<LocationProvider>(context, listen: false).locationData;
    if (lData != null) {
      setState(() {
        locationData = lData;
      });
      return;
    }

    setState(() {
      _loadingLocation = true;
    });
    try {
      var updateStoresDistances =
          Provider.of<StoreProvider>(context, listen: false)
              .addStoreDistanceAndSortThem;
      var locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      await locationProvider.fetchAndUpdateUserLocation(
          context, updateStoresDistances);
      LocationData? l = locationProvider.locationData;
      if (l != null) {
        setState(() {
          locationData = l;
        });
      } else {
        showSnackBar(
            context: context,
            message: 'لم يتم تحديد موقعك',
            snackBarType: SnackBarType.error);
      }
    } catch (e) {
      try {
        showSnackBar(
            context: context,
            message: e.toString(),
            snackBarType: SnackBarType.error);
      } catch (e) {
        if (kDebugMode) {
          // print(e.toString());
          rethrow;
        }
      }
    }

    setState(() {
      _loadingLocation = false;
    });
  }

  @override
  void initState() {
    addScrollListener();
    loadLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var storesProvider = Provider.of<StoreProvider>(context);
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          SizedBox(width: double.infinity),
          VSpace(factor: 2),
          // if (storesProvider.nearByStores.isNotEmpty)
          OpenSearchBox(
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.routeName,
                  arguments: {'searchType': SearchTypes.store});
            },
          ),
          _loadingLocation
              ? Expanded(
                  child: Loading(
                    title: 'جاري تحديد الموقع',
                  ),
                )
              : locationData == null
                  ? NearbyStoresNoLocation(
                      onTap: loadLocation,
                    )
                  : storesProvider.nearByStores.isEmpty
                      ? Expanded(
                          child: EmptyWidget(title: 'لا توجد محلات قريبة'))
                      : Expanded(
                          child: Column(
                            children: [
                              VSpace(),
                              Expanded(
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      controller: scrollController,
                                      physics: BouncingScrollPhysics(),
                                      child: Column(
                                        children: List.generate(
                                          storesProvider.nearByStores.length,
                                          (index) => StoreFullPost(
                                            storeModel: storesProvider
                                                .nearByStores[index],
                                            myLocation:
                                                locationFromLocationData(
                                                    locationData!),
                                          ),
                                        ),
                                      ),
                                    ),
                                    OpenStoresMapButton(
                                        active: mapsButtonActive),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
        ],
      ),
    );
  }
}
