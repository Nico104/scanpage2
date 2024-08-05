// import 'dart:io' show Platform;
// import 'dart:ui';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:scanpage/utils/models/m_pet_profile.dart';
// import 'package:sizer/sizer.dart';

// import 'features/action_buttons/action_buttons_widget.dart';
// import 'features/contacts/contact_list.dart';
// import 'features/pictures/pictures_widget.dart';
// import 'general/shy_button.dart';
// import 'package:scanpage/general/colors.dart' as colors;

// class PetScreen extends StatefulWidget {
//   const PetScreen({super.key, required this.petProfileDetails});

//   final PetProfileDetails petProfileDetails;

//   @override
//   State<PetScreen> createState() => _PetScreenState();
// }

// class _PetScreenState extends State<PetScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Center(
//                 //   child: Padding(
//                 //     padding: EdgeInsets.fromLTRB(25.w, 15.w, 25.w, 16),
//                 //     child: Hero(
//                 //       // tag:
//                 //       //     "picture${widget.pictures.elementAt(position).petPictureId}",
//                 //       tag: "d",
//                 //       child: AspectRatio(
//                 //         aspectRatio: 1,
//                 //         child: ClipRRect(
//                 //           borderRadius: BorderRadius.circular(8),
//                 //           child: Image.network(
//                 //             // s3BaseUrl +
//                 //             //     widget.pictures.elementAt(position).petPictureLink,
//                 //             "https://picsum.photos/400",
//                 //             fit: BoxFit.cover,
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Image.network(
//                     // s3BaseUrl +
//                     //     widget.pictures.elementAt(position).petPictureLink,
//                     "https://picsum.photos/800",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(
//                     widget.petProfileDetails.petName,
//                     style: Theme.of(context).textTheme.headlineLarge,
//                   ),
//                 ),
//                 // const SizedBox(height: 22),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(
//                     widget.petProfileDetails.petDescription.first.text,
//                     style: Theme.of(context).textTheme.displayMedium,
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: ContactList(
//                     petContacts: widget.petProfileDetails.petContacts,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Scaffold(),
//           // ShyButton(
//           //   label: "Send Gps Location",
//           //   onTap: () {},
//           //   showUploadButton: true,
//           //   bgColor: colors.accent,
//           //   icon: Icon(
//           //     Icons.gps_fixed,
//           //     color: Colors.white,
//           //   ),
//           // ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ActionButtons(),
//           ),
//         ],
//       ),
//     );
//   }
// }
