import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scanpage/features/pictures/picture_expanded.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../general/network_globals.dart';
import '../../utils/models/m_pet_picture.dart';
import '../../utils/utils_theme/custom_colors.dart';

class Pictures extends StatefulWidget {
  const Pictures({super.key, required this.pictures});

  final List<PetPicture> pictures;

  @override
  State<Pictures> createState() => _PicturesState();
}

class _PicturesState extends State<Pictures> {
  final PageController _controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            // itemCount: widget.pictures.length,
            itemCount: 4,
            itemBuilder: (context, position) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      barrierDismissible: true,
                      pageBuilder: (BuildContext context, _, __) {
                        return PetPictureExpanded(
                          // picture: widget.pictures.elementAt(position),
                          picture: null,
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  // tag:
                  //     "picture${widget.pictures.elementAt(position).petPictureId}",
                  tag: "d",
                  child: Image.network(
                    // s3BaseUrl +
                    //     widget.pictures.elementAt(position).petPictureLink,
                    "https://picsum.photos/400",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
