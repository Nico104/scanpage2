// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:scanpage/utils/models/medical/m_medical_information.dart';
// import '../behaviour/beh_item.dart';
// import 'health_issue_item.dart';

// class MedInformation extends StatelessWidget {
//   const MedInformation({Key? key, required this.medInformation})
//       : super(key: key);

//   final MedicalInformation medInformation;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         medInformation.sterilized != null
//             ? BehItem(
//                 answer: getAnswer(medInformation.sterilized!),
//                 title: "sp_med_info_spayed_Label".tr(),
//                 subtitle: "sp_med_info_spayed_Desc".tr(),
//               )
//             : const SizedBox.shrink(),
//         ListView.builder(
//           shrinkWrap: true,
//           itemCount: medInformation.healthIssues.length,
//           itemBuilder: (context, index) {
//             return HealthIssueItem(
//               healthIssue: medInformation.healthIssues.elementAt(index),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// String getAnswer(bool answer) {
//   if (answer) {
//     return "Yes";
//   } else {
//     return "No";
//   }
// }
