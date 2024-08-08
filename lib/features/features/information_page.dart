// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scanpage/utils/models/m_behaviour_information.dart';
// import 'package:scanpage/utils/models/m_pet_profile.dart';
// import 'package:scanpage/utils/widgets/custom_scroll_view.dart';
// import 'package:sizer/sizer.dart';

// class InformationPage extends StatefulWidget {
//   const InformationPage({
//     super.key,
//     required this.petProfileDetails,
//   });

//   @override
//   State<InformationPage> createState() => _InformationPageState();

//   final PetProfileDetails petProfileDetails;
// }

// class _InformationPageState extends State<InformationPage> {
//   Gender? _gender;
//   late Future<BehaviourInformation> _behaviourInformationFuture;

//   @override
//   void initState() {
//     super.initState();
//     _gender = widget.petProfileDetails.petGender;
//     // _behaviourInformationFuture =
//     //     getBehaviourInformation(widget.petProfileDetails.profileId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: CustomNicoScrollView(
//         title: Text("Information".tr()),
//         body: Column(
//           children: [
//             const SizedBox(height: 16),
//             InformationDisplay(
//               label: "Name",
//               data: "Taco",
//             ),
//           ],
//         ),
//         onScroll: () {},
//       ),
//     );
//   }
// }

// class InformationDisplay extends StatelessWidget {
//   const InformationDisplay({Key? key, required this.label, this.data})
//       : super(key: key);

//   final String label;
//   final String? data;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 32),
//         Row(
//           children: [
//             Text(
//               label,
//               style: GoogleFonts.openSans(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 22,
//                 color: Colors.black.withOpacity(0.65),
//               ),
//             ),
//             Text(
//               data ?? "Oops",
//               style: GoogleFonts.openSans(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 24,
//                 color: Colors.black.withOpacity(0.85),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
