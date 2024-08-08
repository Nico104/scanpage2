import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/features/behaviour/beh_info.dart';
import 'package:scanpage/features/behaviour/beh_item.dart';
import 'package:scanpage/pet_screen.dart';
import 'package:scanpage/utils/models/m_behaviour_information.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';
import 'package:scanpage/utils/widgets/custom_scroll_view.dart';
import 'package:sizer/sizer.dart';

class InformationSection extends StatefulWidget {
  const InformationSection({
    super.key,
    required this.petProfileDetails,
  });

  @override
  State<InformationSection> createState() => _InformationSectionState();

  final PetProfileDetails petProfileDetails;
}

class _InformationSectionState extends State<InformationSection> {
  Gender? _gender;
  late Future<BehaviourInformation> _behaviourInformationFuture;

  @override
  void initState() {
    super.initState();
    _gender = widget.petProfileDetails.petGender;
    // _behaviourInformationFuture =
    // getBehaviourInformation(widget.petProfileDetails.profileId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.petProfileDetails.hide_information &&
                widget.petProfileDetails.hide_medical)
            ? const SizedBox.shrink()
            : Column(
                children: [
                  const SizedBox(height: 28),
                  const SizedBox(height: 8),
                  SectionTitle(
                    title: "Information".tr(),
                  ),
                  const SizedBox(height: 8),
                ],
              ),

        // ListTile(
        //   title: Text("Name"),
        //   subtitle: Text(widget.petProfileDetails.petName),
        // ),
        widget.petProfileDetails.hide_information
            ? const SizedBox.shrink()
            : Column(
                children: [
                  InformationDisplay(
                    label: "Name",
                    data: widget.petProfileDetails.petName,
                  ), // const SizedBox(height: 6),
                  InformationDisplay(
                    label: "Gender",
                    data: widget.petProfileDetails.petGender.toString(),
                  ),
                  // const SizedBox(height: 8),
                  SectionDivider(),
                  InformationDisplay(
                    label: "Chip Number",
                    data: widget.petProfileDetails.petChipId,
                  ),
                  InformationDisplay(
                    label: "Licence Number",
                    data: widget.petProfileDetails.pet_licenceID,
                  ),
                  InformationDisplay(
                    label: "Tattoo ID",
                    data: widget.petProfileDetails.pet_tattooID,
                  ),
                  SectionDivider(),
                  InformationDisplay(
                    label: "Favorite Activities",
                    data: widget.petProfileDetails.pet_favorite_activities,
                    compact: false,
                  ),
                  InformationDisplay(
                    label: "Favorite Toys",
                    data: widget.petProfileDetails.pet_favorite_toys,
                    compact: false,
                  ),
                  InformationDisplay(
                    label: "Special Needs",
                    data: widget.petProfileDetails.pet_special_needs,
                    compact: false,
                  ),
                  InformationDisplay(
                    label: "Diet Preferences",
                    data: widget.petProfileDetails.pet_diet_preferences,
                    compact: false,
                  ),
                  InformationDisplay(
                    label: "Behavioral Notes",
                    data: widget.petProfileDetails.pet_behavioral_notes,
                    compact: false,
                  ),
                  const SizedBox(height: 16),
                  SectionDivider(),
                  const SizedBox(height: 16),
                  BehInformation(
                    behaviourInformation:
                        widget.petProfileDetails.behaviourInformation,
                  ),
                  SectionDivider(), const SizedBox(height: 16),
                ],
              ),

        widget.petProfileDetails.hide_medical
            ? const SizedBox.shrink()
            : Column(
                children: [
                  widget.petProfileDetails.medicalInformation.sterilized != null
                      ? BehItem(
                          answer: getAnswer(widget.petProfileDetails
                              .medicalInformation.sterilized!),
                          title: "sp_med_info_spayed_Label".tr(),
                          subtitle: "sp_med_info_spayed_Desc".tr(),
                        )
                      : const SizedBox.shrink(),
                  InformationDisplay(
                    label: "Breed",
                    data: widget.petProfileDetails.medicalInformation.breed,
                  ),
                  InformationDisplay(
                    label: "Age",
                    data: widget.petProfileDetails.medicalInformation.age,
                  ),
                  InformationDisplay(
                    label: "Vaccinations",
                    data: widget
                        .petProfileDetails.medicalInformation.vaccinations,
                    compact: false,
                  ),
                  InformationDisplay(
                    label: "Allergies",
                    data: widget.petProfileDetails.medicalInformation.allergies,
                    compact: false,
                  ),
                  InformationDisplay(
                    label: "Medications",
                    data:
                        widget.petProfileDetails.medicalInformation.medications,
                    compact: false,
                  ),
                  InformationDisplay(
                    label: "Chronic Conditions",
                    data: widget
                        .petProfileDetails.medicalInformation.chronicConditions,
                    compact: false,
                  ),
                ],
              ),
      ],
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Divider(
        color: Colors.grey.shade300,
        thickness: 0.5,
        height: 0,
      ),
    );
  }
}

class InformationDisplay extends StatelessWidget {
  const InformationDisplay({
    Key? key,
    required this.label,
    this.data,
    this.compact = true,
  }) : super(key: key);

  final String label;
  final String? data;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      if (data!.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            overflowSpacing: 6,
            spacing: 16,
            children: [
              Text(
                // label + ":  ",
                label + " ",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.45),
                ),
              ),
              // Spacer(),
              Text(
                data ?? "Oops",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.85),
                ),
              ),
            ],
          ),
        );
        if (compact) {
          return Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    // label + ":  ",
                    label + " ",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.45),
                    ),
                  ),
                  Spacer(),
                  Text(
                    data ?? "Oops",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.45),
                ),
              ),
              Text(
                data ?? "Oops",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.85),
                ),
              ),
            ],
          );
        }
      }
    }
    return const SizedBox.shrink();
  }
}
