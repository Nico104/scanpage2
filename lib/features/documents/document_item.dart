import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/models/m_document.dart';

class DocumentItem extends StatelessWidget {
  const DocumentItem({super.key, required this.document});

  final Document document;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(Icons.file_present),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                document.documentName,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward),
          ],
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}
