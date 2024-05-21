// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../theme/theme.dart';
//
// class GalleryPhotoViewWrapper extends StatefulWidget {
//   GalleryPhotoViewWrapper({
//     Key? key,
//     this.loadingBuilder,
//     this.backgroundDecoration,
//     this.minScale,
//     this.maxScale,
//     this.initialIndex = 0,
//     required this.galleryItems,
//     this.scrollDirection = Axis.horizontal,
//   })  : pageController = PageController(initialPage: initialIndex),
//         super(key: key);
//
//   final LoadingBuilder? loadingBuilder;
//   final BoxDecoration? backgroundDecoration;
//   final dynamic minScale;
//   final dynamic maxScale;
//   final int initialIndex;
//   final PageController pageController;
//   final List<BannerEntity> galleryItems;
//   final Axis scrollDirection;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _GalleryPhotoViewWrapperState();
//   }
// }
//
// class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
//   late int currentIndex = widget.initialIndex;
//
//   void onPageChanged(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: widget.backgroundDecoration,
//         constraints: BoxConstraints.expand(
//           height: MediaQuery.of(context).size.height,
//         ),
//         child: Stack(
//           // alignment: Alignment.topLeft,
//           children: <Widget>[
//             PhotoViewGallery.builder(
//               scrollPhysics: const BouncingScrollPhysics(),
//               builder: _buildItem,
//               itemCount: widget.galleryItems.length,
//               loadingBuilder: widget.loadingBuilder,
//               backgroundDecoration: widget.backgroundDecoration,
//               pageController: widget.pageController,
//               onPageChanged: onPageChanged,
//               scrollDirection: widget.scrollDirection,
//             ),
//             Positioned(
//               top: 20,
//               left: 10,
//               child: IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: Image.asset(
//                     "assets/remove.png",
//                     color: whiteColor,
//                     height: defaultPadding / 1.25,
//                     width: defaultPadding / 1.25,
//                   )),
//             ),
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: defaultPadding,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(widget.galleryItems.length, (index) {
//                   return currentIndex == index
//                       ? const ActiveDot()
//                       : const InactiveDot();
//                 }),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
//     final BannerEntity item = widget.galleryItems[index];
//     return PhotoViewGalleryPageOptions(
//       imageProvider: NetworkImage("${ApiConstants.localUrl}${item.image}"),
//       initialScale: PhotoViewComputedScale.contained,
//       minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
//       maxScale: PhotoViewComputedScale.covered * 4.1,
//       heroAttributes: const PhotoViewHeroAttributes(tag: 1),
//     );
//   }
// }
