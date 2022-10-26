import 'package:flutter/material.dart';

class NavBarIcon {
  final String active;
  final String inactive;
  final Widget widget;
  final bool isMain;

  const NavBarIcon({
    required this.active,
    required this.inactive,
    required this.widget,
    this.isMain = false,
  });
}
