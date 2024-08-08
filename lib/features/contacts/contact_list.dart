import 'package:flutter/material.dart';

import '../../utils/models/m_contact.dart';
import 'contact_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key, required this.petContacts}) : super(key: key);

  final List<Contact> petContacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: petContacts.length,
      itemBuilder: (context, index) {
        return ContactItem(
          contact: petContacts.elementAt(index),
        );
      },
    );
  }
}
