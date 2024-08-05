import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/models/m_contact.dart';
import '../../utils/models/m_language.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://picsum.photos/400",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 7,
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
                      Text(
                        "${contact.contactTelephoneNumbers.elementAt(index).country.countryPhonePrefix} ${contact.contactTelephoneNumbers.elementAt(index).phoneNumber}",
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 8),
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
              const SizedBox(height: 8),
              Wrap(
                children: getLanguagesSpoken(contact.languagesSpoken),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

List<Widget> getLanguagesSpoken(List<Language> languages) {
  List<Widget> list = [];
  list.add(
    Text(
      "Sprachen: ",
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
