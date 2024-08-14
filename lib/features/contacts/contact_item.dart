import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/features/contacts/choose_contact_dialog.dart';
import 'package:scanpage/features/contacts/contact_dialog.dart';
import 'package:scanpage/features/language/m_language.dart';
import 'package:scanpage/general/hex_color.dart';
import 'package:scanpage/utils/models/m_phone_number.dart';
import 'package:scanpage/utils/widgets/custom_nico_modal.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/models/m_contact.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCustomNicoModalBottomSheet(
          context: context,
          child: ChooseContactOption(
            contact: contact,
          ),
          isScrollController: true,
        );
        // launchUrlString(
        //     "tel://" + contact.contactTelephoneNumbers.first.phoneNumber);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.black.withOpacity(0.2), width: 0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(8.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "https://picsum.photos/400",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.contactName,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.95),
                        ),
                      ),
                      const SizedBox(height: 8),
                      //Phone Numbers
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: contact.contactTelephoneNumbers.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                // "${contact.contactTelephoneNumbers.elementAt(index).country.countryPhonePrefix} ${contact.contactTelephoneNumbers.elementAt(index).phoneNumber}",
                                "${contact.contactTelephoneNumbers.elementAt(index).phoneNumber}",
                                style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          );
                        },
                      ),
                      contact.contactEmail != null
                          ? Text(
                              contact.contactEmail ?? "",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 8),
                      contact.contactAddress != null
                          ? Text(
                              contact.contactAddress ?? "",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 8),
                      contact.contactInstagram != null
                          ? Text(
                              contact.contactInstagram ?? "",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 8),
                      contact.contactFacebook != null
                          ? Text(
                              contact.contactFacebook ?? "",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            )
                          : const SizedBox.shrink(),
                      // const SizedBox(height: 8),
                      // Wrap(
                      //   children: getLanguagesSpoken(contact.languagesSpoken),
                      // ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getLanguagesSpoken(List<Language> languages) {
  List<Widget> list = [];
  list.add(
    Text(
      "sp_contactLanguagesSpoken".tr(),
      style: GoogleFonts.openSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(0.9),
      ),
    ),
  );
  for (int i = 0; i < languages.length; i++) {
    list.add(
      Text(
        languages.elementAt(i).languageLabel,
        style: GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.black.withOpacity(0.9),
        ),
      ),
    );
    if (i < languages.length - 1) {
      list.add(
        Text(
          ", ",
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
      );
    }
  }
  return list;
}

List<PhoneNumber> extractPhoneNumbers(Contact contact) {
  return contact.contactTelephoneNumbers;
}

class ChooseContactOption extends StatelessWidget {
  const ChooseContactOption({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ContactModalElement(
          title: contact.contactEmail,
          subtitle: "Email",
          icon: Icon(Icons.email_outlined),
          onTap: () {
            final Uri toLaunch = Uri(
              scheme: 'mailto',
              path: contact.contactEmail,
            );
            launchUrl(toLaunch);
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: extractPhoneNumbers(contact).length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                final Uri toLaunch = Uri(
                    scheme: 'tel',
                    host: extractPhoneNumbers(contact)
                        .elementAt(index)
                        .phoneNumber);
                launchUrl(toLaunch);
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "${phoneNumbers.elementAt(index).country.countryPhonePrefix} ${phoneNumbers.elementAt(index).phoneNumber}",
                          extractPhoneNumbers(contact)
                              .elementAt(index)
                              .phoneNumber,
                          style: GoogleFonts.openSans(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          contact.contactName,
                          style: GoogleFonts.openSans(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                            color: HexColor("#8A7861"),
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.call_outlined),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ContactModalElement extends StatelessWidget {
  const ContactModalElement(
      {Key? key,
      this.title,
      this.subtitle,
      required this.icon,
      required this.onTap})
      : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget icon;
  final VoidCallback onTap;

  Widget getSubtitleWidget(String? subtitle) {
    if (subtitle != null) {
      if (subtitle.isNotEmpty) {
        return Column(
          children: [
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.openSans(
                fontSize: 19,
                fontWeight: FontWeight.normal,
                color: HexColor("#8A7861"),
              ),
            ),
          ],
        );
      }
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      if (title!.isNotEmpty) {
        return InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    getSubtitleWidget(subtitle),
                  ],
                ),
                icon,
              ],
            ),
          ),
        );
      }
    }
    return const SizedBox.shrink();
  }
}
