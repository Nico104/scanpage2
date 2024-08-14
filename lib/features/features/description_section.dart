import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/pet_screen.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.petProfileDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        SectionTitle(
          title: "sp_PetScreen_Titles_Description".tr(),
        ),
        const SizedBox(height: 16),
        Text(
          petProfileDetails.description,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black.withOpacity(0.9),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  final PetProfileDetails petProfileDetails;
}
