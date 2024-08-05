import 'dart:typed_data';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../general/network_globals.dart';
import '../../utils/models/m_pet_picture.dart';

class PetPictureExpanded extends StatelessWidget {
  const PetPictureExpanded({super.key, required this.picture});

  final PetPicture? picture;

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
            child: Hero(
              // tag: "picture${picture.petPictureId}",
              tag: "t",
              child: Material(
                borderRadius: BorderRadius.circular(22),
                elevation: 8,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 80.w,
                    minWidth: 5.w,
                    maxHeight: 80.h,
                    minHeight: 5.h,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.network(
                        // s3BaseUrl + picture.petPictureLink,
                        "https://picsum.photos/800"
                        // 'fit: BoxFit.contain,
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
