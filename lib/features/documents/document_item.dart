import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/general/network_globals.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/models/m_document.dart';

class DocumentItem extends StatelessWidget {
  const DocumentItem({super.key, required this.document});

  final Document document;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            launchUrl(
              Uri.parse(s3BaseUrl + document.documentLink),
            );
          },
          child: Row(
            children: [
              const Icon(Icons.file_present),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  document.documentName,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.85),
                  ),
                ),
              ),
              // const Spacer(),
              const SizedBox.square(dimension: 8),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}
