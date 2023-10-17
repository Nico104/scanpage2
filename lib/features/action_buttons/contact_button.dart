import 'package:flutter/material.dart';
import 'package:scanpage/utils/utils_theme/custom_colors.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  final double _borderRadius = 32;
  final double _height = 65;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
      // onTap: () => onTap(),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        elevation: 8,
        child: Container(
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
            // color: Theme.of(context).primaryColor.withOpacity(1),
            color: getCustomColors(context).accent!,
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
                    "Contact",
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
                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
