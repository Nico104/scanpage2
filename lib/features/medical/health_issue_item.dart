import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/models/medical/m_health_issue.dart';

class HealthIssueItem extends StatelessWidget {
  const HealthIssueItem({super.key, required this.healthIssue});

  final HealthIssue healthIssue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              healthIssue.healthIssueName,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            healthIssue.linkedDocuemntId != null
                ? Icon(Icons.file_present)
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}
