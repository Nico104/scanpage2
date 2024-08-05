import 'package:flutter/material.dart';
import 'package:scanpage/utils/widgets/loading_indicator.dart';
import 'package:sizer/sizer.dart';

class CustomNicoModalBottomSheet extends StatelessWidget {
  const CustomNicoModalBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: child,
      ),
    );
  }
}

void showCustomNicoModalBottomSheet({
  required BuildContext context,
  required Widget child,
  required bool isScrollController,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: isScrollController,
    builder: (context) {
      // return AnnotatedRegion<SystemUiOverlayStyle>(
      //   value: const SystemUiOverlayStyle(
      //     // statusBarColor: Colors.transparent,
      //     systemNavigationBarColor: Colors.transparent,
      //   ),
      //   child: Container(
      //     margin: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      //     padding: const EdgeInsets.all(16),
      //     decoration: BoxDecoration(
      //       color: Theme.of(context).primaryColor,
      //       borderRadius: BorderRadius.circular(28),
      //     ),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: widget.moreOptions,
      //     ),
      //   ),
      // );
      return CustomNicoModalBottomSheet(
        child: child,
      );
    },
  );
}

void showCustomNicoLoadingModalBottomSheet({
  required BuildContext context,
  required Future<dynamic> future,
  required Function(dynamic) callback,
}) {
  BuildContext? dialogContext;
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: false,
    builder: (buildContext) {
      dialogContext = buildContext;
      return const CustomNicoModalBottomSheet(
        child: SizedBox(
          height: 60,
          width: 60,
          child: CustomLoadingIndicatior(),
        ),
      );
      // return Container(
      //   margin: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      //   padding: const EdgeInsets.all(16),
      //   decoration: BoxDecoration(
      //     color: Theme.of(context).primaryColor,
      //     borderRadius: BorderRadius.circular(28),
      //   ),
      //   child: const SizedBox(
      //     height: 60,
      //     width: 60,
      //     child: CustomLoadingIndicatior(),
      //   ),
      // );
    },
  );
  future.then(
    (value) {
      Navigator.pop(dialogContext!);
      callback(value);
    },
  );
  // createHealthIssue(
  //   healthIssueName: "New Health Information",
  //   healthIssueType: "Misc",
  //   medicalId: _medicalInformation!.medicalInformationId,
  // ).then(
  //   (value) {
  //     Navigator.pop(dialogContext!);
  //     _refreshMedicalInformation();
  //     Navigator.of(context)
  //         .push(
  //       PageRouteBuilder(
  //         opaque: false,
  //         barrierDismissible: true,
  //         pageBuilder: (BuildContext context, _, __) {
  //           return HealthIssueUpdateBox(
  //             healthIssue: value,
  //             nameLabel: "Label",
  //             petProfileId: widget.petProfileDetails.profileId,
  //           );
  //         },
  //       ),
  //     )
  //         .then((value) {
  //       _refreshMedicalInformation();
  //     });
  //   },
  // );
}


//  showCustomNicoModalBottomSheet(
//       context: context,
//       child: ,
//     );