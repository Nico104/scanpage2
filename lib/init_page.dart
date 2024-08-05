import 'package:flutter/material.dart';
import 'package:scanpage/pet_screen.dart';
import 'package:scanpage/utils/u_http_methods.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    // return Text("Wuhu");
    return FutureBuilder(
      future: getPetFromScan(code),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PetScreen(
            petProfileDetails: snapshot.data!,
          );
          // return Text("Wuhu");
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Material(child: CircularProgressIndicator());
        }
      },
    );
  }
}
