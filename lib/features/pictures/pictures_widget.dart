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
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.pictures.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      barrierDismissible: true,
                      pageBuilder: (BuildContext context, _, __) {
                        return PetPictureExpanded(
                          picture: widget.pictures.elementAt(position),
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag:
                      "picture${widget.pictures.elementAt(position).petPictureId}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                      s3BaseUrl +
                          widget.pictures.elementAt(position).petPictureLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SmoothPageIndicator(
                controller: _controller, // PageController
                count: widget.pictures.length,
                effect: WormEffect(
                  // activeDotColor: getCustomColors(context).accent!,
                  activeDotColor: Colors.white,
                  // dotColor: Colors.white.withOpacity(0.25),
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 12,
                  // type: WormType.thin,
                ),
                onDotClicked: (index) {
                  _controller.jumpToPage(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
