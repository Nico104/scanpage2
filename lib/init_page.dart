import 'package:flutter/material.dart';
import 'package:scanpage/features/homepage/look_for_tag.dart';
import 'package:scanpage/pet_screen.dart';
import 'package:scanpage/utils/u_http_methods.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key, required this.code, required this.scanned});

  final String code;
  final bool scanned;

  @override
  Widget build(BuildContext context) {
    // return Text("Wuhu");
    return FutureBuilder(
      future: getPetFromScan(code, scanned: scanned),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PetScreen(
            petProfileDetails: snapshot.data!,
            scanned: scanned,
          );
          // return Text("Wuhu");
        } else if (snapshot.hasError) {
          return const LookForTag();
        } else {
          return const Material(child: CircularProgressIndicator());
        }
      },
    );
  }
}
