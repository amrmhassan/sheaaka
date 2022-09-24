// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

//? list loader constants
const double maxLoaderRadius = 100;
const double radiusFactor = 2;

const double maxMargin = 1000;
const double marginFactor = 5;

const rotationSpeedFactor = 100;

class ListLoader extends StatefulWidget {
  // final List<Widget> children;
  final int? itemCount;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;

  const ListLoader({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    // required this.children,
    this.padding,
  });

  @override
  State<ListLoader> createState() => _ListLoaderState();
}

class _ListLoaderState extends State<ListLoader> {
  ScrollController scrollController = ScrollController();
  GlobalKey listViewKey = GlobalKey();
  GlobalKey listViewSizedBoxKey = GlobalKey();
  double? hiddenListHeight;

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

// //? get full list height
//   double get fullListHeight {

//   }

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

    scrollController.addListener(() {
      //* this will return the height of the list that is hidden under the full list height
      extentAfter = scrollController.position.extentAfter;
      //* this will return the height of the list that is hidden above the full list height
      extentBefore = scrollController.position.extentBefore;
      if (hiddenListHeight == null) {
        setState(() {
          hiddenListHeight = extentAfter;
        });
      }

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //* the height of the list viewport that is show in the screen
        // double listHeight = listViewKey.currentContext!.size!.height;
        //* the height of the full list (height of its children and their paddings, margins, etc)
        // double fullListHeight = hiddenListHeight! + listHeight;

        //* the difference of between the full list height and the list height
        // double heightDifference = hiddenListHeight!;
        //? fixed after and fixed before are some helper variables to calculate the space the list will
        //? stretch because its bouncy nature
        //? topScrollSpace = space hidden under the full list height - height difference
        //? this demonstrate what i am trying to say
        //? |----------------------|
        //? |                      |
        //? |     list height      |
        //? |                      |
        //? |                      |
        //? |----------------------|
        //? |                      |
        //? |                      |
        //? |  height difference   |
        //? |                      |
        //? |                      |
        //? |                      |
        //? |----------------------|
        //# |    topScrollSpace    |
        //# |----------------------|
        setState(() {
          topScrollSpace = extentAfter - hiddenListHeight!;
          bottomScrollSpace = extentBefore - hiddenListHeight!;
        });
      });
    });
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
        SizedBox(
          key: listViewSizedBoxKey,
          child: ListView.builder(
            padding: widget.padding,
            key: listViewKey,
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

class LoaderArrow extends StatelessWidget {
  final double opacity;
  final double radius;
  final double rotation;

  const LoaderArrow({
    Key? key,
    required this.radius,
    required this.opacity,
    required this.rotation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(rotation),
      origin: Offset(radius / 2, radius / 2),
      child: Container(
        padding: EdgeInsets.all(mediumPadding),
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(500),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 0),
              // spreadRadius: 15,
            ),
          ],
        ),
        child: Opacity(
          opacity: opacity,
          child: Image.asset(
            'assets/icons/loading.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
