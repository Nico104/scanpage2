import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/features/pictures/picture_expanded.dart';
import 'package:scanpage/features/pictures/pictures_longGrid.dart';
import 'package:scanpage/features/pictures/single_picture.dart';
import 'package:scanpage/general/network_globals.dart';
import 'package:scanpage/utils/utils_general.dart';

import '../../utils/models/m_pet_picture.dart';

class Pictures extends StatefulWidget {
  const Pictures({
    super.key,
    required this.pictures,
    // required this.height,
    // required this.width,
  });

  final List<PetPicture> pictures;
  // final double height, width;

  @override
  State<Pictures> createState() => _PicturesState();
}

class _PicturesState extends State<Pictures> {
  // final PageController _controller = PageController(viewportFraction: 1);

  final int maxPictureGridLenght = 6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: widget.height,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: GestureDetector(
          onTap: () {
            navigatePerSlide(
                context,
                PicturesPage(
                  initialPetPictures: widget.pictures,
                ));
          },
          child: GridView.builder(
            itemCount: widget.pictures.length <= maxPictureGridLenght
                ? widget.pictures.length
                : maxPictureGridLenght,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // crossAxisCount: 1,
              childAspectRatio: 1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == maxPictureGridLenght - 1) {
                if (widget.pictures.length <= maxPictureGridLenght) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PictureItem(
                      picture: widget.pictures.elementAt(index),
                      expandable: false,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.06),
                        ),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+${widget.pictures.length - (maxPictureGridLenght - 1)}",
                              style: GoogleFonts.openSans(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              "more",
                              style: GoogleFonts.openSans(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PictureItem(
                  picture: widget.pictures.elementAt(index),
                  expandable: false,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PictureItem extends StatelessWidget {
  const PictureItem({
    super.key,
    required this.picture,
    required this.expandable,
  });

  final PetPicture picture;

  final bool expandable;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !expandable,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              barrierDismissible: true,
              pageBuilder: (BuildContext context, _, __) {
                return PetPictureExpanded(
                  picture: picture,
                );
              },
            ),
          );
        },
        child: Hero(
          tag: "picture${picture.petPictureId}",
          child: Material(
            borderRadius: BorderRadius.circular(8),
            elevation: expandable ? 4 : 0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SinglePicture(
                    imageUrl: s3BaseUrl + picture.petPictureLink)),
          ),
        ),
      ),
    );
  }
}
