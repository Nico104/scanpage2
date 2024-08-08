import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/general/hex_color.dart';

class BehItem extends StatelessWidget {
  const BehItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.answer,
  });

  final String title, subtitle, answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                Text(
                  subtitle,
                  // style: GoogleFonts.prompt(
                  //   fontWeight: FontWeight.normal,
                  //   fontSize: 16,
                  //   color: HexColor("#8A7861"),
                  // ),
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.45),
                  ),
                ),
              ],
            ),
            Text(
              answer,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.black.withOpacity(0.9),
              ),
            )
          ],
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}
