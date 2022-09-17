import 'package:flutter/material.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/screens/cart_screen/cart_screen.dart';
import 'package:project/screens/orders_screen/orders_screen.dart';
import 'package:project/screens/profile_screen/widgets/profile_page_element.dart';
import 'package:provider/provider.dart';

class ProfileScreenOptions extends StatelessWidget {
  const ProfileScreenOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cartItemNumber = Provider.of<CartProvider>(context).cartItems.length;
    return Column(
      children: [
        ProfilePageElement(
          title: 'معلوماتي الشخصية',
          iconName: 'user1',
          onTap: () {},
        ),
        ProfilePageElement(
          title: 'الإعدادات',
          iconName: 'settings',
          onTap: () {},
        ),
        ProfilePageElement(
          title: "عربة التسوق",
          iconName: 'shopping-cart',
          onTap: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          },
          notifyTitle: cartItemNumber == 0 ? null : cartItemNumber.toString(),
        ),
        ProfilePageElement(
          title: "الطلبيات",
          iconName: 'clipboard',
          onTap: () {
            Navigator.pushNamed(context, OrdersScreen.routeName);
          },
          notifyTitle: '2',
        ),
      ],
    );
  }
}
