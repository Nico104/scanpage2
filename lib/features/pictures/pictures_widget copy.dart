// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:scanpage/features/pictures/picture_expanded.dart';

// import '../../utils/models/m_pet_picture.dart';

// class Pictures extends StatefulWidget {
//   const Pictures(
//       {super.key,
//       required this.pictures,
//       required this.height,
//       required this.width});

//   final List<PetPicture> pictures;
//   final double height, width;

//   @override
//   State<Pictures> createState() => _PicturesState();
// }

// class _PicturesState extends State<Pictures> {
//   // final PageController _controller = PageController(viewportFraction: 1);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height,
//       child: ScrollConfiguration(
//         behavior: ScrollConfiguration.of(context).copyWith(
//           dragDevices: {
//             PointerDeviceKind.touch,
//             PointerDeviceKind.mouse,
//           },
//         ),
//         child: ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           // controller: _controller,
//           // pageSnapping: true,
//           scrollDirection: Axis.horizontal,
//           // itemCount: widget.pictures.length,
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.fromLTRB(index == 0 ? 28 : 8.0, 8, 8, 8),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     PageRouteBuilder(
//                       opaque: false,
//                       barrierDismissible: true,
//                       pageBuilder: (BuildContext context, _, __) {
//                         return PetPictureExpanded(
//                           // picture: widget.pictures.elementAt(position),
//                           picture: null,
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 child: SizedBox(
//                   width: widget.width,
//                   height: widget.height,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Hero(
//                       // tag:
//                       //     "picture${widget.pictures.elementAt(position).petPictureId}",
//                       tag: "d",
//                       child: Image.network(
//                         // s3BaseUrl +
//                         //     widget.pictures.elementAt(position).petPictureLink,
//                         "https://picsum.photos/200",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
