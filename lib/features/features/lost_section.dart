import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/features/action_buttons/action_buttons_widget.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';

class LostSection extends StatelessWidget {
  const LostSection(
      {super.key,
      required this.petProfileDetails,
      required this.scanned,
      required this.scrollToContacts});

  final PetProfileDetails petProfileDetails;
  final bool scanned;
  final VoidCallback scrollToContacts;

  @override
  Widget build(BuildContext context) {
    if (!petProfileDetails.petIsLost) {
      return Column(
        children: [
          const SizedBox(height: 28),
          Text(
            "sp_FoundMeInformation".tr(),
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          ActionButtons(
            scanned: scanned,
            petProfileDetails: petProfileDetails,
            scrollToContacts: scrollToContacts,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 8),
          Text(
            "iAmLost".tr(),
            style: GoogleFonts.prompt(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.red.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: petProfileDetails.petIsLostText.isNotEmpty
                ? Text(
                    petProfileDetails.petIsLostText,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  )
                : SizedBox.shrink(),
          ),
          const SizedBox(height: 28),
          Text(
            "sp_FoundMeInformation_Lost".tr(),
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          ActionButtons(
            scanned: scanned,
            petProfileDetails: petProfileDetails,
            scrollToContacts: scrollToContacts,
          ),
        ],
      );
    }
  }
}
