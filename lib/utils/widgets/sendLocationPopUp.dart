import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scanpage/features/action_buttons/location_button.dart';
import 'package:scanpage/general/hex_color.dart';
import 'package:scanpage/utils/models/m_pet_profile.dart';
import 'package:sizer/sizer.dart';

class LocationPopup extends StatefulWidget {
  const LocationPopup({
    super.key,
    required this.petProfileDetails,
    // required this.scanned,
    required this.contactCallback,
  });

  final PetProfileDetails petProfileDetails;
  // final bool scanned;
  final VoidCallback contactCallback;

  @override
  State<LocationPopup> createState() => _LocationPopupState();
}

class _LocationPopupState extends State<LocationPopup> {
  final double _borderRadius = 36;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.06),
          child: Center(
            child: Material(
              borderRadius: BorderRadius.circular(_borderRadius),
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_borderRadius),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  // color: Colors.blue,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 80.w,
                      // minWidth: 40.w,
                      maxHeight: 80.h,
                      // minHeight: 30.h,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "sendLocationPopUpTitle".tr(namedArgs: {
                              'Karamba': widget.petProfileDetails.petName
                            }),
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "sendLocationPopUpSubtitle".tr(namedArgs: {
                              'Karamba': widget.petProfileDetails.petName
                            }),
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: LocationButton(
                              petProfileId: widget.petProfileDetails.profileId,
                              contactCallback: widget.contactCallback,
                            ),
                            // child: Material(
                            //   elevation: 2,
                            //   borderRadius: BorderRadius.circular(36),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       widget.sendLocation();
                            //     },
                            //     child: Container(
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(36),
                            //         color: HexColor("040707"),
                            //       ),
                            //       padding: const EdgeInsets.fromLTRB(
                            //           32, 16, 32, 16),
                            //       child: Text(
                            //         "Send Location",
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .labelMedium
                            //             ?.copyWith(color: Colors.white),
                            //         maxLines: 1,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
