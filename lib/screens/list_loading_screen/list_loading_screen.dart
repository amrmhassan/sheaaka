// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:project/constants/firebase_constants.dart';
// import 'package:project/constants/models_constants.dart';
// import 'package:project/models/product_model.dart';
// import 'package:project/screens/holder_screen/holder_screen.dart';
// import 'package:project/screens/home_screen/widgets/full_post.dart';
// import 'package:project/screens/testing_screen/widgets/list_loader/list_loader.dart';
// import 'package:project/screens/upload_data_screen/upload_data_screen.dart';

// class ListLoadingScreen extends StatefulWidget {
//   static const String routeName = '/list-loading-screen';
//   const ListLoadingScreen({super.key});

//   @override
//   State<ListLoadingScreen> createState() => _ListLoadingScreenState();
// }

// class _ListLoadingScreenState extends State<ListLoadingScreen> {
//   List<ProductModel> products = [];
//   FirebaseFirestore ref = FirebaseFirestore.instance;
//   int ms = 0;
//   bool loading = true;

// //? this will reload and fetch data from the start
//   Future<void> reloadData() async {
//     setState(() {
//       loading = true;
//     });
//     var res = await ref
//         .collection(productsCollectionName)
//         .orderBy(createdAtString, descending: true)
//         .limit(10)
//         .get();
//     List<ProductModel> productsHelper = [];
//     for (var element in res.docs) {
//       var p = ProductModel.fromJSON(element.data());
//       productsHelper.add(p);
//     }
//     setState(() {
//       loading = false;
//       products = productsHelper;
//     });
//   }

// //? this will fetch the products based on their created date and 10 products at a time
//   Future<void> fetchData() async {
//     setState(() {
//       loading = true;
//     });
//     DateTime before = DateTime.now();
//     QuerySnapshot<Map<String, dynamic>> res;
//     if (products.isNotEmpty) {
//       res = await ref
//           .collection(productsCollectionName)
//           .orderBy(createdAtString, descending: true)
//           .limit(10)
//           .startAfter([products.last.createdAt]).get();
//     } else {
//       res = await ref
//           .collection(productsCollectionName)
//           .orderBy(createdAtString, descending: true)
//           .limit(10)
//           .get();
//     }
//     for (var element in res.docs) {
//       var p = ProductModel.fromJSON(element.data());
//       products.add(p);
//     }

//     DateTime after = DateTime.now();
//     setState(() {
//       loading = false;
//       ms = after.difference(before).inMilliseconds;
//     });
//   }

//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var listLoader = ListLoader(
//       reloadingAfterPixels: 130,
//       onLoadNew: () {
//         fetchData();
//         var snackBar = SnackBar(
//             content: Text(
//           'تحميل',
//           style: TextStyle(color: Colors.white),
//         ));

//         ScaffoldMessenger.of(context).showSnackBar(
//           snackBar,
//         );
//       },
//       onReload: () {
//         reloadData();
//         var snackBar = SnackBar(
//             content: Text(
//           'تحميل',
//           style: TextStyle(color: Colors.white),
//         ));

//         ScaffoldMessenger.of(context).showSnackBar(
//           snackBar,
//         );
//       },
//       itemCount: products.length,
//       itemBuilder: (context, index) => FullPost(
//         fullPostModel: products[index],
//       ),
//     );

//     return Scaffold(
//       body: SafeArea(
//         child: loading && products.isEmpty
//             ? Text('Loading')
//             : Column(
//                 children: [
//                   Text(loading
//                       ? 'Loading'
//                       : 'Loaded ${products.length.toString()} Products Took $ms ms'),
//                   Expanded(
//                     child: listLoader,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: fetchData,
//                         child: Text('Get Products'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, HolderScreen.routeName);
//                         },
//                         child: Text('Go Home'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(
//                               context, UploadDataScreen.routeName);
//                         },
//                         child: Text('Add Data'),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//       ),
//     );
//   }
// }
