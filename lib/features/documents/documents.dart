import 'package:flutter/material.dart';

import '../../utils/models/m_document.dart';
import 'document_item.dart';

class DocumentsList extends StatelessWidget {
  const DocumentsList({super.key, required this.petDocuments});

  final List<Document> petDocuments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: petDocuments.length,
      itemBuilder: (context, index) {
        return DocumentItem(
          document: petDocuments.elementAt(index),
        );
      },
    );
  }
}
