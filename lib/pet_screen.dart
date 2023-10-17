import 'dart:io' show Platform;
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';
import 'package:sizer/sizer.dart';

import 'features/action_buttons/action_buttons_widget.dart';
import 'features/pictures/pictures_widget.dart';
import 'general/shy_button.dart';
import 'package:scanpage/general/colors.dart' as colors;

class PetScreen extends StatefulWidget {
  const PetScreen({super.key, required this.petProfileDetails});

  final PetProfileDetails petProfileDetails;

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.w,
                  child: Pictures(
                    pictures: widget.petProfileDetails.petPictures,
                  ),
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    widget.petProfileDetails.petName,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    widget.petProfileDetails.petDescription.first.text,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ),
          ),
          // Scaffold(),
          // ShyButton(
          //   label: "Send Gps Location",
          //   onTap: () {},
          //   showUploadButton: true,
          //   bgColor: colors.accent,
          //   icon: Icon(
          //     Icons.gps_fixed,
          //     color: Colors.white,
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActionButtons(),
          ),
        ],
      ),
    );
  }
}
