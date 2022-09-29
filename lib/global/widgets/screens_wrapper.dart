import 'package:flutter/material.dart';

class ScreensWrapper extends StatelessWidget {
  final Widget child;
  //? drop your scaffold props here
  const ScreensWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Container(
            child: child,
          ),
        ),
      ),
    );
  }
}
