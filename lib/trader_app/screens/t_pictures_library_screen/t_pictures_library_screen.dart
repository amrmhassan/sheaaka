// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/global.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/models/store_model.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_pictures_library_screen/widgets/loaded_images_grid.dart';
import 'package:project/global/widgets/shimmer_loaders/trader_images_shimmer_loading/loading_image_grid_shimmer.dart';
import 'package:provider/provider.dart';

class TPicturesLibraryScreen extends StatefulWidget {
  static const String routeName = '/t-pictures-library-screen';
  const TPicturesLibraryScreen({super.key});

  @override
  State<TPicturesLibraryScreen> createState() => _TPicturesLibraryScreenState();
}

class _TPicturesLibraryScreenState extends State<TPicturesLibraryScreen> {
  bool _loading = false;
  List<Reference> myImages = [];
  List<String> links = [];
  @override
  void initState() {
    _loading = true;
    Future.delayed(Duration.zero).then((value) async {
      StoreModel myStore =
          Provider.of<TraderProvider>(context, listen: false).myStore!;
      var children = await FirebaseStorage.instance
          .ref('$productsImagesDir/${myStore.id}')
          .listAll();

      List<Reference> helperlist = [];
      List<String> linksHelper = [];
      for (var element in children.items) {
        helperlist.add(element);
        String link = await element.getDownloadURL();
        linksHelper.add(link);
      }
      setState(() {
        myImages = helperlist;
        links = linksHelper;
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'الصور',
            rightTitle: true,
            traderStyle: true,
          ),
          _loading ? LoadingImageGridShimmer() : LoadedImgesGrid(links: links),
        ],
      ),
    );
  }
}
