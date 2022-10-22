// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/testing_screen/widgets/list_loader/loader_arrow.dart';

//! viewport list height doesn't change with scrolling and it equals to 762.9

//? list loader constants
const double maxLoaderRadius = 100;
const double radiusFactor = 2;

const double maxMargin = 1000;
const double marginFactor = 5;

const rotationSpeedFactor = 100;

const double startReloadingAfterPixels = 130;
const double startLoadingNewAfterPixels = 0;

class ListLoader extends StatefulWidget {
  final int itemCount;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final VoidCallback onReload;
  final VoidCallback onLoadNew;
  final double reloadingAfterPixels;
  final double loadingNewAfterPixels;
  final bool showBottomLoader;

  const ListLoader({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onReload,
    required this.onLoadNew,
    this.padding,
    this.showBottomLoader = true,
    this.reloadingAfterPixels = startReloadingAfterPixels,
    this.loadingNewAfterPixels = startLoadingNewAfterPixels,
  });

  @override
  State<ListLoader> createState() => _ListLoaderState();
}

class _ListLoaderState extends State<ListLoader> {
  ScrollController scrollController = ScrollController();
  GlobalKey listKey = GlobalKey();
  List<double> scrollDownValues = [];
  List<double> scrollUpValues = [];

  double topScrollSpace = 0;
  double bottomScrollSpace = 0;

  //? get topOpacity
  double get topOpacity {
    return topLoaderRadius / maxLoaderRadius;
  }

  //? get bottomOpacity
  double get bottomOpacity {
    return bottomLoaderRadius / maxLoaderRadius;
  }

  //? get topRotation
  double get topRotation {
    return topScrollSpace / rotationSpeedFactor;
  }

  //? get bottomRotation
  double get bottomRotation {
    return bottomScrollSpace / rotationSpeedFactor;
  }

  //? this will return the top circle top margin
  double get topMargin {
    if (topScrollSpace < 0) {
      return 0;
    } else if (topScrollSpace < maxMargin) {
      return topScrollSpace / marginFactor;
    } else {
      return maxMargin / marginFactor;
    }
  }

  //? this will return the top circle radius
  double get topLoaderRadius {
    if (topScrollSpace < 0) {
      return 0;
    } else if (topScrollSpace < maxLoaderRadius) {
      return topScrollSpace / radiusFactor;
    } else {
      return maxLoaderRadius / radiusFactor;
    }
  }

  //? this will return the top circle top margin
  double get bottomMargin {
    if (bottomScrollSpace < 0) {
      return 0;
    } else if (bottomScrollSpace < maxMargin) {
      return bottomScrollSpace / marginFactor;
    } else {
      return maxMargin / marginFactor;
    }
  }

  //? this will return the bottom circle radius
  double get bottomLoaderRadius {
    if (bottomScrollSpace < 0) {
      return 0;
    } else if (bottomScrollSpace < maxLoaderRadius) {
      return bottomScrollSpace / radiusFactor;
    } else {
      return maxLoaderRadius / radiusFactor;
    }
  }

  void onScroll() {
    double extentAfter = 0;
    double extentBefore = 0;
    scrollController.removeListener(() {});

    scrollController.addListener(() {
      //? this variable is the best solution for this
      //? cause it has the hidden list view height and it doesn't change with scrolling
      double maxScrollExtent = scrollController.position.maxScrollExtent;

      //* this will return the height of the list that is hidden under the full list height
      extentAfter = scrollController.position.extentAfter;

      //* this will return the height of the list that is hidden above the full list height
      extentBefore = scrollController.position.extentBefore;

      setState(() {
        topScrollSpace = extentAfter - maxScrollExtent;
        bottomScrollSpace = extentBefore - maxScrollExtent;
      });

      //! testing scroll controller values
      double scrollDownValue = extentAfter - maxScrollExtent;
      double scrollUpValue = extentBefore - maxScrollExtent;
      scrollDownValues.add(scrollDownValue);
      scrollUpValues.add(scrollUpValue);

      //! testing scroll controller values
    });
  }

//? this will handle scrolling events(start, end ) and run the
  bool onNotificationHandler(notification) {
    try {
      if (notification is ScrollStartNotification) {
        //* starting scrolling
        scrollDownValues.clear();
        scrollUpValues.clear();
      } else if (notification is ScrollEndNotification) {
        //* ending scrolling
        // for scrolling down to reach the top
        double downLast = scrollDownValues.last;
        double downMaxValue = scrollDownValues.reduce(max);

        if (downMaxValue > widget.reloadingAfterPixels && downLast == 0) {
          widget.onReload();
        }

        // for scrolling up to reach the bottom
        double upLast = scrollUpValues.last;
        double upMaxValue = scrollUpValues.reduce(max);
        if (upMaxValue > widget.loadingNewAfterPixels && upLast == 0) {
          widget.onLoadNew();
        }
      }
    } catch (E) {
      if (kDebugMode) {
        print('------------------');
        print(E);
        print('------------------');
      }
    }
    return true;
  }

  @override
  void initState() {
    onScroll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        NotificationListener(
          onNotification: onNotificationHandler,
          child: ListView.builder(
            key: listKey,
            padding: widget.padding,
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: topMargin,
            ),
            LoaderArrow(
              radius: topLoaderRadius,
              opacity: topOpacity,
              rotation: topRotation,
            ),
          ],
        ),
        if (widget.showBottomLoader)
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                LoaderArrow(
                  radius: bottomLoaderRadius,
                  opacity: bottomOpacity,
                  rotation: bottomRotation,
                ),
                SizedBox(
                  height: bottomMargin,
                )
              ],
            ),
          ),
      ],
    );
  }
}
