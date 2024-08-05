// import 'dart:typed_data';
// import 'dart:ui';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:scanpage/utils/models/m_contact.dart';
// import 'package:scanpage/utils/models/m_phone_number.dart';
// import 'package:sizer/sizer.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../general/hex_color.dart';
// import '../../general/network_globals.dart';
// import '../../utils/models/m_pet_picture.dart';
// import '../../utils/utils_theme/custom_colors.dart';

// class ChoosePhoneNumber extends StatelessWidget {
//   const ChoosePhoneNumber(
//       {super.key, required this.phoneNumbers, required this.contact});

//   final List<PhoneNumber> phoneNumbers;
//   final List<Contact> contact;

//   @override
//   Widget build(BuildContext context) {
//     return BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           color: Colors.black.withOpacity(0.06),
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Hero(
//                 // tag: "picture${picture.petPictureId}",
//                 tag: "contactChoose",
//                 child: Material(
//                   borderRadius: BorderRadius.circular(22),
//                   elevation: 8,
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.9),
//                       // borderRadius: BorderRadius.only(
//                       //     topLeft: Radius.circular(8),
//                       //     topRight: Radius.circular(8)),
//                       borderRadius: BorderRadius.circular(22),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: phoneNumbers.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             final Uri toLaunch = Uri(
//                                 scheme: 'tel',
//                                 host: phoneNumbers
//                                         .elementAt(index)
//                                         .country
//                                         .countryPhonePrefix +
//                                     phoneNumbers.elementAt(index).phoneNumber);
//                             launchUrl(toLaunch);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "${phoneNumbers.elementAt(index).country.countryPhonePrefix} ${phoneNumbers.elementAt(index).phoneNumber}",
//                                       style: GoogleFonts.openSans(
//                                         fontSize: 22,
//                                         fontWeight: FontWeight.normal,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 2),
//                                     Text(
//                                       "${contact.elementAt(index).contactName}",
//                                       style: GoogleFonts.openSans(
//                                         fontSize: 19,
//                                         fontWeight: FontWeight.normal,
//                                         color: HexColor("#8A7861"),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Icon(Icons.call_outlined),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
