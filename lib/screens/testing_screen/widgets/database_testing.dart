// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class User {
//   final String id;
//   final String name;
//   const User({
//     required this.id,
//     required this.name,
//   });
// }

// class TestingScreen extends StatefulWidget {
//   static const String routeName = '/testing-screen';
//   const TestingScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TestingScreen> createState() => _TestingScreenState();
// }

// class _TestingScreenState extends State<TestingScreen> {
//   bool _loading = false;
//   List<User> users = [];
//   DatabaseReference ref = FirebaseDatabase.instance.ref();

//   Future<void> createDataFireStore() async {
//     var ref = FirebaseFirestore.instance;
//     String id = Random().nextInt(5000).toString();
//     String name = 'name$id';
//     ref.collection('users').doc(id).set({'name': name, 'id': id});
//   }

//   Future<void> createData() async {
//     String id = Random().nextInt(5000).toString();
//     String name = 'name$id';
//     await ref.child('/users').child(id).set({'name': name, 'id': id});
//   }

//   Future<void> getData() async {
//     setState(() {
//       _loading = true;
//     });
//     List<User> u = [];
//     var res = await ref.child('/users').get();
//     var body = res.children;
//     u = body.map((e) {
//       String id = e.child('id').value.toString();
//       String name = e.child('name').value.toString();
//       return User(id: id, name: name);
//     }).toList();
//     setState(() {
//       users = u;
//       _loading = false;
//     });
//   }

//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//           ),
//           ElevatedButton(
//             onPressed: createData,
//             child: Text('Add Data'),
//           ),
//           ElevatedButton(
//             onPressed: getData,
//             child: Text('Get Data'),
//           ),
//           Text(users.length.toString()),
//           SizedBox(height: 20),
//           Expanded(
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: _loading
//                   ? Text('Loading')
//                   : Column(
//                       children: users
//                           .map(
//                             (e) => Container(
//                               padding: EdgeInsets.symmetric(
//                                 vertical: 5,
//                                 horizontal: 20,
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(e.name),
//                                   Spacer(),
//                                   Text(e.id),
//                                 ],
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
