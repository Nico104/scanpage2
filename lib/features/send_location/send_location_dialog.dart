import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../general/hex_color.dart';
import '../../utils/widgets/custom_scroll_view.dart';

class SendLocationDialog extends StatelessWidget {
  const SendLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's the best way to contact you?",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Your GPS location has been automatically sent to the dog owner to assist in the reunion process",
              style: GoogleFonts.prompt(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 30),
            // Text(
            //   "Phone number",
            //   style: GoogleFonts.prompt(
            //     fontWeight: FontWeight.w400,
            //     fontSize: 18,
            //     color: Colors.black.withOpacity(1),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "Send my phone number",
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: HexColor("#8A7861"),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Text(
                      "Send",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "Send my email address",
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: HexColor("#8A7861"),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Text(
                      "Send",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Show Contact",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "I'll contact them myself",
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: HexColor("#8A7861"),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Text(
                      "Contact",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
