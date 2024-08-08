import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scanpage/features/contacts/choose_contact_dialog.dart';
import 'package:scanpage/utils/models/m_contact.dart';
import 'package:scanpage/utils/models/m_phone_number.dart';
import 'package:scanpage/utils/utils_theme/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../general/hex_color.dart';
import '../../utils/models/m_pet_profile.dart';
import '../../utils/widgets/custom_nico_modal.dart';

class ContactButton extends StatelessWidget {
  const ContactButton(
      {super.key,
      required this.petProfileDetails,
      required this.scrollToContacts});

  final PetProfileDetails petProfileDetails;

  final double _borderRadius = 32;
  final double _height = 65;

  final VoidCallback scrollToContacts;

  String? getPrimaryNumber(BuildContext context) {
    int contactamount = petProfileDetails.petContacts.length;
    int phoneNumbersTotal = 0;
    for (var element in petProfileDetails.petContacts) {
      phoneNumbersTotal += element.contactTelephoneNumbers.length;
    }

    if (phoneNumbersTotal == 1) {
      //Call that one phoine number
    } else if (phoneNumbersTotal == 0) {
      //initiate mail or social media
    } else {
      if (contactamount == 0) {
        //No contact for tabo send location
      } else if (contactamount == 1) {
        //skip contact choosing
      } else {
        //initiate contact choosing
        // Navigator.of(context).push(
        //   PageRouteBuilder(
        //     opaque: false,
        //     barrierDismissible: true,
        //     pageBuilder: (BuildContext context, _, __) {
        //       return ChoosePhoneNumber();
        //     },
        //   ),
        // );
      }
    }
  }

  PhoneNumber? getSinglePhoneNumber() {
    for (var element in petProfileDetails.petContacts) {
      if (element.contactTelephoneNumbers.isNotEmpty) {
        return element.contactTelephoneNumbers.first;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
      onTap: () {
        // final Uri toLaunch = Uri(scheme: 'tel', host: '214324234');
        // launchUrl(toLaunch);

        // launch("https://wa.me/${214324234}?text=Hello");

        List<PhoneNumber> phoneNumbers = [];
        List<Contact> contact = [];
        for (var element in petProfileDetails.petContacts) {
          element.contactTelephoneNumbers.forEach((number) {
            phoneNumbers.add(number);
            contact.add(element);
          });
        }

        if (phoneNumbers.isEmpty) {
          //initiate mail or social media
          scrollToContacts();
        }
        if (phoneNumbers.length == 1) {
          //call unique number
          // final Uri toLaunch = Uri(
          //     scheme: 'tel',
          //     host: phoneNumbers.first.country.countryPhonePrefix +
          //         phoneNumbers.first.phoneNumber);
          final Uri toLaunch =
              Uri(scheme: 'tel', host: phoneNumbers.first.phoneNumber);
          launchUrl(toLaunch);
        } else {
          // Navigator.of(context).push(
          //   PageRouteBuilder(
          //     opaque: false,
          //     barrierDismissible: true,
          //     pageBuilder: (BuildContext context, _, __) {
          //       return ChoosePhoneNumber(
          //         phoneNumbers: phoneNumbers,
          //         contact: contact,
          //       );
          //     },
          //   ),
          // );
          showCustomNicoModalBottomSheet(
            context: context,
            child: ChoosePhoneNumber(
              phoneNumbers: phoneNumbers,
              contact: contact,
            ),
            isScrollController: true,
          );
        }
      },
      child: Hero(
        tag: 'contactChoose',
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          elevation: 8,
          child: Container(
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
              // color: Theme.of(context).primaryColor.withOpacity(1),
              color: HexColor("#8A7861"),
              // border: Border.all(color: Colors.black, width: 1),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32, right: 24),
                    child: Text(
                      "sp_ContactButtonLabel".tr(),
                      // style: GoogleFonts.prompt(
                      //   fontWeight: FontWeight.w400,
                      //   fontSize: 16,
                      //   color: fontColor ?? Colors.white,
                      // ),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Center(
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
