import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/screens/store_screen/store_screen.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:provider/provider.dart';

class ShowMyStoreButton extends StatelessWidget {
  const ShowMyStoreButton({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {
        Navigator.pushNamed(context, StoreScreen.routeName,
            arguments: Provider.of<TraderProvider>(context, listen: false)
                .myStore!
                .id);
      },
      backgroundColor: Colors.transparent,
      child: Image.asset(
        'assets/icons/view.png',
        width: largeIconSize,
        color: kTraderPrimaryColor,
      ),
    );
  }
}
