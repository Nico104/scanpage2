import 'package:flutter/material.dart';
import 'package:scanpage/features/homepage/look_for_tag.dart';
import 'package:scanpage/pet_screen.dart';
import 'package:scanpage/utils/u_http_methods.dart';

class InitPageShare extends StatelessWidget {
  const InitPageShare({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    // return Text("Wuhu");
    return FutureBuilder(
      future: getPetFromId(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PetScreen(
            petProfileDetails: snapshot.data!,
            scanned: false,
          );
          // return Text("Wuhu");
        } else if (snapshot.hasError) {
          //TODO 404
          return ErrorWidget("");
        } else {
          return Material(child: CircularProgressIndicator());
        }
      },
    );
  }
}
