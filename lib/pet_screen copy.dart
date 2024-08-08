// import 'dart:ui';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scanpage/utils/models/m_pet_profile.dart';
// import 'package:sizer/sizer.dart';

// import 'features/action_buttons/action_buttons_widget.dart';
// import 'features/behaviour/beh_info.dart';
// import 'features/contacts/contact_list.dart';
// import 'features/documents/documents.dart';
// import 'features/medical/med_info.dart';
// import 'features/pictures/pictures_widget.dart';

// class PetScreen extends StatefulWidget {
//   const PetScreen({super.key, required this.petProfileDetails});

//   final PetProfileDetails petProfileDetails;

//   @override
//   State<PetScreen> createState() => _PetScreenState();
// }

// class _PetScreenState extends State<PetScreen> {
//   @override
//   Widget build(BuildContext context) {
//     print(widget.petProfileDetails.medicalInformation.healthIssues.length);
//     return Scaffold(
//       body: Stack(
//         children: [
//           ScrollConfiguration(
//             behavior:
//                 ScrollConfiguration.of(context).copyWith(scrollbars: false),
//             child: SingleChildScrollView(
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Stack(
//                     //   alignment: Alignment.bottomCenter,
//                     //   children: [
//                     //     SizedBox(
//                     //       width: 30.w,
//                     //       child: Pictures(
//                     //         pictures: [],
//                     //       ),
//                     //     ),
//                     //     Align(
//                     //       alignment: Alignment.bottomCenter,
//                     //       child: Container(
//                     //         height: 10,
//                     //         decoration: const BoxDecoration(
//                     //             color: Colors.white,
//                     //             borderRadius: BorderRadius.only(
//                     //                 topLeft: Radius.circular(8),
//                     //                 topRight: Radius.circular(8))),
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // IgnorePointer(
//                     //   child: SizedBox(
//                     //     height: 100.w - 16,
//                     //   ),
//                     // ),
//                     const SizedBox(height: 28),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Spacer(),
//                         Expanded(
//                           flex: 2,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               "https://picsum.photos/400",
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         // Expanded(
//                         //   flex: 8,
//                         //   child: Column(
//                         //     children: [
//                         //       Text(
//                         //         "Meet",
//                         //         style: GoogleFonts.openSans(
//                         //           fontSize: 28,
//                         //           fontWeight: FontWeight.w700,
//                         //           color: Colors.black.withOpacity(0.95),
//                         //         ),
//                         //         textAlign: TextAlign.center,
//                         //       ),
//                         //       Text(
//                         //         widget.petProfileDetails.petName,
//                         //         style: GoogleFonts.openSans(
//                         //           fontSize: 28,
//                         //           fontWeight: FontWeight.w700,
//                         //           color: Colors.black.withOpacity(0.95),
//                         //         ),
//                         //         textAlign: TextAlign.center,
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         // Spacer(),
//                       ],
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 28, right: 28),
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 24),
//                             Text(
//                               widget.petProfileDetails.petName,
//                               style: GoogleFonts.openSans(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.black.withOpacity(0.95),
//                               ),
//                             ),
//                             const SizedBox(height: 28),
//                             Text(
//                               "Hi! I'm Taco. Nice to meet you. If you found me without my owner consider calling or sending my positions with the buttons below.",
//                               style: GoogleFonts.openSans(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 color: Colors.black.withOpacity(0.9),
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 28),
//                             ActionButtons(
//                               petProfileDetails: widget.petProfileDetails,
//                             ),
//                             const SizedBox(height: 28),
//                             Text(
//                               "To make navigating my profile easier for you we added buttons so you can jump to whatever you are looking for",
//                               style: GoogleFonts.openSans(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 color: Colors.black.withOpacity(0.9),
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Chip Nr: 123456789012",
//                                   style: GoogleFonts.prompt(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.black.withOpacity(0.5),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 18,
//                                   child: VerticalDivider(
//                                     color: Colors.black.withOpacity(0.5),
//                                   ),
//                                 ),
//                                 Text(
//                                   "profileDetailsGenderButtonLabelFemale".tr(),
//                                   style: GoogleFonts.prompt(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.pink.withOpacity(0.5),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 32),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "sp_PetScreen_Titles_Contact".tr(),
//                                 style: GoogleFonts.openSans(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 24,
//                                   color: Colors.black.withOpacity(0.95),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             ContactList(
//                               petContacts: widget.petProfileDetails.petContacts,
//                             ),
//                             const SizedBox(height: 32),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "sp_PetScreen_Titles_Behaviour".tr(),
//                                 style: GoogleFonts.openSans(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 24,
//                                   color: Colors.black.withOpacity(0.95),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             BehInformation(
//                               behaviourInformation:
//                                   widget.petProfileDetails.behaviourInformation,
//                             ),
//                             const SizedBox(height: 32),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "sp_PetScreen_Titles_MedInfo".tr(),
//                                 style: GoogleFonts.openSans(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 24,
//                                   color: Colors.black.withOpacity(0.95),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             MedInformation(
//                               medInformation:
//                                   widget.petProfileDetails.medicalInformation,
//                             ),
//                             const SizedBox(height: 32),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "sp_PetScreen_Titles_Documents".tr(),
//                                 style: GoogleFonts.openSans(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 24,
//                                   color: Colors.black.withOpacity(0.95),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             DocumentsList(
//                               petDocuments:
//                                   widget.petProfileDetails.petDocuments,
//                             ),
//                             const SizedBox(
//                               height: 2000,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Center(
//                     //   child: Padding(
//                     //     padding: EdgeInsets.fromLTRB(25.w, 15.w, 25.w, 16),
//                     //     child: Hero(
//                     //       // tag:
//                     //       //     "picture${widget.pictures.elementAt(position).petPictureId}",
//                     //       tag: "d",
//                     //       child: AspectRatio(
//                     //         aspectRatio: 1,
//                     //         child: ClipRRect(
//                     //           borderRadius: BorderRadius.circular(8),
//                     //           child: Image.network(
//                     //             // s3BaseUrl +
//                     //             //     widget.pictures.elementAt(position).petPictureLink,
//                     //             "https://picsum.photos/400",
//                     //             fit: BoxFit.cover,
//                     //           ),
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
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

//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: ActionButtons(
//           //     petProfileDetails: widget.petProfileDetails,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
