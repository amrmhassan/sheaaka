// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:project/constants/sizes.dart';
// import 'package:project/constants/styles.dart';
// import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';

// class InnerPagesAppBar extends StatelessWidget {
//   final Widget? rightIcon;
//   final String? title;

//   const InnerPagesAppBar({
//     Key? key,
//     this.title,
//     this.rightIcon,
//   }) : super(key: key);

//   Widget getAppBarChild(BuildContext context) {
//     return Row(
//       children: [
//         rightIcon != null
//             ? SizedBox(
//                 width: roundIconRadius,
//                 child: rightIcon,
//               )
//             : SizedBox(
//                 width: roundIconRadius,
//               ),
//         Expanded(
//           child: Text(
//             title ?? '',
//             style: h1TextStyle,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         AppBarIcon(
//           iconName: 'arrow',
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         right: kHPad / 2,
//         left: kHPad / 2,
//         top: kVPad,
//       ),
//       child: getAppBarChild(context),
//     );
//   }
// }




// // if (title != null) {
//     //   return Stack(
//     //     alignment: Alignment.centerLeft,
//     //     clipBehavior: Clip.none,
//     //     children: [
//     //       SizedBox(
//     //         width: double.infinity,
//     //         child: Text(
//     //           title!,
//     //           style: h1TextStyle,
//     //           textAlign: TextAlign.center,
//     //         ),
//     //       ),
//     //       AppBarIcon(
//     //         iconName: 'arrow',
//     //         onTap: () {
//     //           Navigator.pop(context);
//     //         },
//     //       ),
//     //     ],
//     //   );
//     // } else {
//     //   return Row(
//     //     children: [
//     //       if (rightIcon != null)
//     //         rightIcon!
//     //       else
//     //         Expanded(
//     //           child: SizedBox(
//     //             width: double.infinity,
//     //           ),
//     //         ),
//     //       Spacer(),
//     //       AppBarIcon(
//     //         iconName: 'arrow',
//     //         onTap: () {
//     //           Navigator.pop(context);
//     //         },
//     //       ),
//     //     ],
//     //   );
//     // }
