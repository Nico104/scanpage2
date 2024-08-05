import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';
import 'package:sizer/sizer.dart';

import 'features/action_buttons/action_buttons_widget.dart';
import 'features/behaviour/beh_info.dart';
import 'features/contacts/contact_list.dart';
import 'features/documents/documents.dart';
import 'features/medical/med_info.dart';
import 'features/pictures/pictures_widget.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key, required this.petProfileDetails});

  final PetProfileDetails petProfileDetails;

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.petProfileDetails.medicalInformation.healthIssues.length);
    return Scaffold(
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Pictures(
                          pictures: [],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                        ),
                      ),
                    ],
                  ),
                  // IgnorePointer(
                  //   child: SizedBox(
                  //     height: 100.w - 16,
                  //   ),
                  // ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            widget.petProfileDetails.petName,
                            style: GoogleFonts.openSans(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.95),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Chip Nr: 123456789012",
                                style: GoogleFonts.prompt(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 18,
                                child: VerticalDivider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                "Female",
                                style: GoogleFonts.prompt(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.pink.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          Text(
                            widget.petProfileDetails.petDescription.first.text,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Contact",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.black.withOpacity(0.95),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ContactList(
                            petContacts: widget.petProfileDetails.petContacts,
                          ),
                          const SizedBox(height: 32),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Behaviour",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.black.withOpacity(0.95),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          BehInformation(
                            behaviourInformation:
                                widget.petProfileDetails.behaviourInformation,
                          ),
                          const SizedBox(height: 32),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Medical Information",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.black.withOpacity(0.95),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          MedInformation(
                            medInformation:
                                widget.petProfileDetails.medicalInformation,
                          ),
                          const SizedBox(height: 32),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Documents",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.black.withOpacity(0.95),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          DocumentsList(
                            petDocuments: widget.petProfileDetails.petDocuments,
                          ),
                          const SizedBox(
                            height: 2000,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Center(
                  //   child: Padding(
                  //     padding: EdgeInsets.fromLTRB(25.w, 15.w, 25.w, 16),
                  //     child: Hero(
                  //       // tag:
                  //       //     "picture${widget.pictures.elementAt(position).petPictureId}",
                  //       tag: "d",
                  //       child: AspectRatio(
                  //         aspectRatio: 1,
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(8),
                  //           child: Image.network(
                  //             // s3BaseUrl +
                  //             //     widget.pictures.elementAt(position).petPictureLink,
                  //             "https://picsum.photos/400",
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
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
            child: ActionButtons(
              petProfileDetails: widget.petProfileDetails,
            ),
          ),
        ],
      ),
    );
  }
}
