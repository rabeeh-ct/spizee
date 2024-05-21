// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class CardItemShimmer extends StatelessWidget {
//   const CardItemShimmer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: defaultPadding * 6,
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(defaultPadding / 2))),
//       child: Card(
//         shape: RoundedRectangleBorder(
//             borderRadius:
//                 const BorderRadius.all(Radius.circular(defaultPadding / 2))),
//         elevation: defaultPadding / 10,
//         child: Shimmer.fromColors(
//           baseColor: const Color(0xFFD6D6D6),
//           highlightColor: Colors.white,
//           direction: ShimmerDirection.ttb,
//           child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
//               child: Container(
//                 color: whiteColor,
//                 width: defaultPadding * 4,
//                 height: defaultPadding * 4,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     color: whiteColor,
//                     height: defaultPadding / 2,
//                     width: defaultPadding * 6,
//                   ),
//                   defaultSpacer,
//                   Container(
//                     color: whiteColor,
//                     height: defaultPadding / 2,
//                     width: defaultPadding * 4,
//                   )
//                 ],
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
