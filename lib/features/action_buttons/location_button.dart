import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/widgets/custom_nico_modal.dart';
import '../send_location/send_location_dialog.dart';
// import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  final double _borderRadius = 32;
  final double _height = 65;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
      onTap: () async {
        showCustomNicoModalBottomSheet(
          context: context,
          child: SendLocationDialog(),
          isScrollController: true,
        );

        bool serviceEnabled;
        LocationPermission permission;

        // Test if location services are enabled.
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          // Location services are not enabled don't continue
          // accessing the position and request users of the
          // App to enable the location services.
          return Future.error('Location services are disabled.');
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.
            return Future.error('Location permissions are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.

        print(await Geolocator.getCurrentPosition());
        Geolocator.getCurrentPosition().then((value) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SendLocationDialog(),
          //   ),
          // );
        });

        // final Location location = new Location();
        // print(await location.getLocation());
        // LocationPermission permission = await Geolocator.requestPermission();
        // print(permission);
      },
      child: Hero(
        tag: 'locationButton',
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          elevation: 2,
          child: Container(
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
              // color: Theme.of(context).primaryColor.withOpacity(1),
              color: Theme.of(context).canvasColor,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32, right: 24),
                    child: Text(
                      "Location",
                      // style: GoogleFonts.prompt(
                      //   fontWeight: FontWeight.w400,
                      //   fontSize: 16,
                      //   color: fontColor ?? Colors.white,
                      // ),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Center(
                      child: Icon(Icons.gps_fixed_rounded),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// /// Determine the current position of the device.
// ///
// /// When the location services are not enabled or permissions
// /// are denied the `Future` will return an error.
// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }
