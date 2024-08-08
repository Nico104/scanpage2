import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scanpage/features/action_buttons/contact_button.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';

import 'location_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons(
      {super.key,
      required this.petProfileDetails,
      required this.scrollToContacts,
      required this.scanned});

  final PetProfileDetails petProfileDetails;
  final VoidCallback scrollToContacts;
  final bool scanned;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // height: 200,
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).canvasColor.withOpacity(0.01),
                Theme.of(context).canvasColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 32),
            child: OverflowBar(
              alignment: MainAxisAlignment.spaceEvenly,
              overflowAlignment: OverflowBarAlignment.center,
              overflowSpacing: 16,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: (scanned
                      ? petProfileDetails.scan_hide_contacts
                      : petProfileDetails.hide_contacts)
                  ? [
                      LocationButton(
                        petProfileId: petProfileDetails.profileId,
                        contactCallback: scrollToContacts,
                      ),
                    ]
                  : [
                      LocationButton(
                        petProfileId: petProfileDetails.profileId,
                        contactCallback: scrollToContacts,
                      ),
                      // Spacer(),
                      ContactButton(
                        petProfileDetails: petProfileDetails,
                        scrollToContacts: scrollToContacts,
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
