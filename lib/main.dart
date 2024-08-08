import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scanpage/features/homepage/look_for_tag.dart';
import 'package:scanpage/init_page_share.dart';
import 'package:scanpage/utils/utils_theme/theme_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toastification/toastification.dart';

import 'init_page.dart';

// Widget _buildRunnableApp({
//   required bool isWeb,
//   required double webAppWidth,
//   required Widget app,
// }) {
//   if (!isWeb) {
//     return app;
//   }

//   return Center(
//     child: ClipRect(
//       child: SizedBox(
//         width: webAppWidth,
//         child: app,
//       ),
//     ),
//   );
// }

Widget _buildRunnableApp({
  required bool isWeb,
  required double webAppWidth,
  required double webAppHeight,
  required Widget app,
}) {
  if (!isWeb) {
    return app;
  }

  return Container(
    // margin: EdgeInsets.all(16),
    width: double.infinity,
    height: double.infinity,
    child: Center(
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: webAppWidth,
            height: webAppHeight,
            child: app,
          ),
        ),
      ),
    ),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Beamer.setPathUrlStrategy();
  //? Doesnt wokr on firebase deploy

  final runnableApp = _buildRunnableApp(
    isWeb: kIsWeb,
    webAppWidth: 680,
    webAppHeight: 1080,
    app: MyApp(),
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        // Locale('de'),
        // Locale('it'),
        // Locale('hu'),
        // Locale('no'),
        // Locale('fr'),
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          // ChangeNotifierProvider<ConnectionService>(
          //     create: (_) => ConnectionService()),
          ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
          // ChangeNotifierProvider<UploadStatus>(create: (_) => UploadStatus())
        ],
        child: runnableApp,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  //ScanPage
  // final routerDelegate = BeamerDelegate(
  //   locationBuilder: RoutesLocationBuilder(
  //     routes: {
  //       // Return either Widgets or BeamPages if more customization is needed
  //       '/': (context, state, data) => const BeamPage(
  //             key: ValueKey('book-'),
  //             title: 'A Book',
  //             popToNamed: '/',
  //             type: BeamPageType.scaleTransition,
  //             // child: InitPage(
  //             //   code: "1111111111111111",
  //             // ),
  //             child: LookForTag(),
  //           ),
  //       '/:bookId': (context, state, data) {
  //         String code = state.pathParameters['bookId']!;
  //         bool scanned = code.endsWith('1');

  //         code = code.substring(0, code.length - 1);
  //         print("code" + code);

  //         return BeamPage(
  //           key: ValueKey('book-$code'),
  //           title: 'A Book #$code',
  //           popToNamed: '/',
  //           type: BeamPageType.scaleTransition,
  //           // child: Scaffold(
  //           //   body: Text(bookId),
  //           // ),
  //           child: InitPage(
  //             code: code,
  //             scanned: scanned,
  //           ),
  //         );
  //       }
  //     },
  //   ),
  // );

  //SharePage
  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // // Return either Widgets or BeamPages if more customization is needed
        // '/': (context, state, data) => const BeamPage(
        //       key: ValueKey('book-'),
        //       title: 'A Book',
        //       popToNamed: '/',
        //       type: BeamPageType.scaleTransition,
        //       // child: InitPage(
        //       //   code: "1111111111111111",
        //       // ),
        //       child: LookForTag(),
        //     ),
        '/:bookId': (context, state, data) {
          String id = state.pathParameters['bookId']!;
          // bool scanned = code.endsWith('1');

          // code = code.substring(0, code.length - 1);
          // print("code" + code);

          return BeamPage(
            key: ValueKey('book-$id'),
            title: 'A Book #$id',
            popToNamed: '/',
            type: BeamPageType.scaleTransition,
            // child: Scaffold(
            //   body: Text(bookId),
            // ),
            child: InitPageShare(
              id: id,
            ),
          );
        }
      },
    ),
  );

  //END

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<ThemeNotifier>(builder: (context, theme, _) {
          return ToastificationWrapper(
            child: MaterialApp.router(
              routeInformationParser: BeamerParser(),
              routerDelegate: routerDelegate,
              theme: theme.getTheme(),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
            ),
          );
        });
      },
    );
  }
}
