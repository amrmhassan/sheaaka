// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
// import 'package:project/helpers/data_creator.dart';
// import 'package:project/providers/products_provider.dart';
// import 'package:project/providers/store_provider.dart';
// import 'package:project/providers/whishlists_provider.dart';
// import 'package:project/utils/general_utils.dart';
// import 'package:provider/provider.dart';

// class RandomCreatorCheatOpen extends StatefulWidget {
//   const RandomCreatorCheatOpen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<RandomCreatorCheatOpen> createState() => _RandomCreatorCheatOpenState();
// }

// class _RandomCreatorCheatOpenState extends State<RandomCreatorCheatOpen> {
//   int secondsTaken = 0;
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController storesNumberController = TextEditingController();
//     storesNumberController.text = storesNumber.toString();

//     TextEditingController productsNumberController = TextEditingController();
//     productsNumberController.text = productsNumber.toString();

//     TextEditingController offersNumberController = TextEditingController();
//     offersNumberController.text = offersNumber.toString();

//     TextEditingController wishlistsNumberController = TextEditingController();
//     wishlistsNumberController.text = wishlistsNumber.toString();
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           isScrollControlled: true,
//           backgroundColor: Colors.transparent,
//           context: context,
//           builder: (ctx) => ModalWrapper(
//             onApply: () {
//               storesNumber = int.parse(storesNumberController.text);
//               productsNumber = int.parse(productsNumberController.text);
//               offersNumber = int.parse(offersNumberController.text);
//               wishlistsNumber = int.parse(wishlistsNumberController.text);
//               DateTime before = DateTime.now();
//               dc = DataCreator();
//               DateTime after = DateTime.now();
//               Provider.of<ProductsProvider>(context, listen: false).refresh();
//               Provider.of<StoreProvider>(context, listen: false).refresh();
//               Provider.of<WishListsProvider>(context, listen: false).refresh();
//               setState(() {
//                 secondsTaken = after.difference(before).inMilliseconds;
//               });
//             },
//             applyButtonTitle: 'Apply',
//             child: Column(
//               children: [
//                 Text(
//                     'Time Taken Last Time: ${doubleToString(secondsTaken / 1000, 3)} S'),
//                 CheatNumberElement(
//                   controller: storesNumberController,
//                   title: 'Stores',
//                 ),
//                 CheatNumberElement(
//                   controller: productsNumberController,
//                   title: 'Products',
//                 ),
//                 CheatNumberElement(
//                   controller: offersNumberController,
//                   title: 'Offers',
//                 ),
//                 CheatNumberElement(
//                   controller: wishlistsNumberController,
//                   title: 'Wishlists',
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       child: Container(
//         width: 50,
//         height: 50,
//         color: Colors.transparent,
//       ),
//     );
//   }
// }

// class CheatNumberElement extends StatelessWidget {
//   final String title;
//   const CheatNumberElement({
//     Key? key,
//     required this.controller,
//     required this.title,
//   }) : super(key: key);

//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       textDirection: TextDirection.ltr,
//       children: [
//         Text(title),
//         Spacer(),
//         SizedBox(
//             width: 50,
//             child: TextField(
//               keyboardType: TextInputType.number,
//               controller: controller,
//             )),
//       ],
//     );
//   }
// }
