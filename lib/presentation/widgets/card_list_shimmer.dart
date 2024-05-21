// import 'package:flutter/material.dart';
//
// import '../theme/theme.dart';
// import 'default_app_bar.dart';
//
// class CardListShimmer extends StatelessWidget {
//   const CardListShimmer({Key? key,this.back=true}) : super(key: key);
//   final bool back;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: AppBar().preferredSize,
//         child:  DefaultAppBar(back: back),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(
//             vertical: defaultPadding * 2, horizontal: defaultPadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [...List.generate(3, (index) => const CardItemShimmer())],
//         ),
//       ),
//     );
//   }
// }
