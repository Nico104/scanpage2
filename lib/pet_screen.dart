import 'dart:math';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/features/features/description_section.dart';
import 'package:scanpage/features/features/information_page.dart';
import 'package:scanpage/features/features/information_section.dart';
import 'package:scanpage/general/network_globals.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';
import 'package:scanpage/utils/utils_general.dart';
import 'package:sizer/sizer.dart';

import 'features/action_buttons/action_buttons_widget.dart';
import 'features/behaviour/beh_info.dart';
import 'features/contacts/contact_list.dart';
import 'features/documents/documents.dart';
import 'features/medical/med_info.dart';
import 'features/pictures/pictures_widget.dart';

class PetScreen extends StatefulWidget {
  const PetScreen(
      {super.key, required this.petProfileDetails, required this.scanned});

  final PetProfileDetails petProfileDetails;
  final bool scanned;

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  List<GlobalKey> keyCap = List<GlobalKey>.generate(
      4, (index) => GlobalKey(debugLabel: 'key_$index'),
      growable: false);

  // ScrollController scrollController = ScrollController();

  void jumpToSection(int keynumber) {
    if (keyCap.elementAt(keynumber - 1).currentContext != null) {
      Scrollable.ensureVisible(keyCap.elementAt(keynumber - 1).currentContext!);
    }
  }

  String getProfilePictureLink() {
    if (widget.petProfileDetails.petPictures.isNotEmpty &&
        !widget.petProfileDetails.hide_contacts) {
      return s3BaseUrl +
          widget.petProfileDetails.petPictures.first.petPictureLink;
    }

    var rng = Random();
    return "${s3BaseUrl}utils/temp/placeholder/pet_placeholder_${rng.nextInt(2) + 1}.jpg";
  }

  bool hideNavigationInfo() {
    return (widget.petProfileDetails.hide_information &&
        widget.petProfileDetails.hide_contacts &&
        widget.petProfileDetails.hide_pictures &&
        widget.petProfileDetails.hide_documents);
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.petProfileDetails.medicalInformation.healthIssues.length);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Container(
              color: Colors.white,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 42),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Spacer(flex: 2),
                        Expanded(
                          flex: 6,
                          child: Material(
                            borderRadius: BorderRadius.circular(16),
                            elevation: 6,
                            child: GestureDetector(
                              onTap: () => jumpToSection(3),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  getProfilePictureLink(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        DefaultSidePadding(
                          child: Column(
                            children: [
                              const SizedBox(height: 46),
                              Text(
                                "Hello! I am",
                                style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.65),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                widget.petProfileDetails.petName,
                                style: GoogleFonts.openSans(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(0.95),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Text(
                                "If you found me without my owner consider calling or sending my positions with the buttons below.",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 28),
                              !widget.scanned
                                  ? const SizedBox.shrink()
                                  : Column(
                                      children: [
                                        const SizedBox(height: 28),
                                        ActionButtons(
                                          scanned: widget.scanned,
                                          petProfileDetails:
                                              widget.petProfileDetails,
                                          scrollToContacts: () =>
                                              jumpToSection(2),
                                        ),
                                      ],
                                    ),
                              const SizedBox(height: 28),
                              Text(
                                "Lorem lorem lorem ipsum",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 28),
                              Column(
                                children: [
                                  MenuBox(
                                    title: "Information",
                                    onTap: () => jumpToSection(1),
                                    hide: widget
                                        .petProfileDetails.hide_information,
                                  ),
                                  MenuBox(
                                    title: "Contacts",
                                    onTap: () => jumpToSection(2),
                                    hide:
                                        widget.petProfileDetails.hide_contacts,
                                  ),
                                  MenuBox(
                                    title: "Pictures",
                                    onTap: () => jumpToSection(3),
                                    hide:
                                        widget.petProfileDetails.hide_pictures,
                                  ),
                                  MenuBox(
                                    title: "Documents",
                                    onTap: () => jumpToSection(4),
                                    hide:
                                        widget.petProfileDetails.hide_documents,
                                  ),
                                ],
                              ),
                              hideNavigationInfo()
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text(
                                        "To make navigating my profile easier for you we added buttons so you can jump to whatever you are looking for",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                              widget.petProfileDetails.hide_information
                                  ? const SizedBox.shrink()
                                  : DescriptionSection(
                                      petProfileDetails:
                                          widget.petProfileDetails,
                                    ),
                              InformationSection(
                                key: keyCap.elementAt(0),
                                petProfileDetails: widget.petProfileDetails,
                              ),
                              widget.petProfileDetails.hide_contacts
                                  ? const SizedBox.shrink()
                                  : Column(
                                      children: [
                                        const SizedBox(height: 32),
                                        SectionTitle(
                                          key: keyCap.elementAt(1),
                                          title: "sp_PetScreen_Titles_Contact"
                                              .tr(),
                                        ),
                                        const SizedBox(height: 24),
                                        ContactList(
                                          petContacts: widget
                                              .petProfileDetails.petContacts,
                                        ),
                                      ],
                                    ),
                              widget.petProfileDetails.hide_pictures
                                  ? const SizedBox.shrink()
                                  : Column(
                                      children: [
                                        const SizedBox(height: 32),
                                        SectionTitle(
                                          key: keyCap.elementAt(2),
                                          title: "Pictures".tr(),
                                        ),
                                        const SizedBox(height: 24),
                                        Pictures(
                                          pictures: widget
                                              .petProfileDetails.petPictures,
                                        ),
                                      ],
                                    ),
                              widget.petProfileDetails.hide_documents
                                  ? const SizedBox.shrink()
                                  : Column(
                                      children: [
                                        const SizedBox(height: 32),
                                        SectionTitle(
                                          key: keyCap.elementAt(3),
                                          title: "Documents".tr(),
                                        ),
                                        const SizedBox(height: 24),
                                        DocumentsList(
                                          petDocuments: widget
                                              .petProfileDetails.petDocuments,
                                        ),
                                      ],
                                    ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
                                  style: Theme.of(context).textTheme.labelSmall,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBox extends StatelessWidget {
  const MenuBox({
    super.key,
    required this.title,
    required this.onTap,
    this.hide = false,
  });

  final String title;
  final VoidCallback onTap;

  final bool hide;

  @override
  Widget build(BuildContext context) {
    if (hide) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.2,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Text(
                  title,
                  style: GoogleFonts.prompt(
                    fontWeight: FontWeight.w300,
                    fontSize: kIsWeb ? 18 : 18,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultSidePadding extends StatelessWidget {
  const DefaultSidePadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28),
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Divider(
                  color: Colors.grey.shade300,
                  thickness: 0.5,
                  height: 0,
                ),
              ),
              Text(
                title,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Colors.black.withOpacity(0.7),
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
