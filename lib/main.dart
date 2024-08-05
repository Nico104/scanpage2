import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:scanpage/utils/utils_theme/theme_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'init_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
        Locale('it'),
        Locale('hu'),
        Locale('no'),
        Locale('fr'),
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
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Return either Widgets or BeamPages if more customization is needed
        '/': (context, state, data) => const BeamPage(
              key: ValueKey('book-'),
              title: 'A Book',
              popToNamed: '/',
              type: BeamPageType.scaleTransition,
              child: InitPage(
                code: "3XrmYgKD4ZL6Fzbz",
              ),
            ),
        // '/books': (context, state, data) => BooksScreen(),
        '/:bookId': (context, state, data) {
          // Take the path parameter of interest from BeamState
          final bookId = state.pathParameters['bookId']!;
          // Collect arbitrary data that persists throughout navigation
          // final info = (data as MyObject).info;
          // Use BeamPage to define custom behavior
          return BeamPage(
            key: ValueKey('book-$bookId'),
            title: 'A Book #$bookId',
            popToNamed: '/',
            type: BeamPageType.scaleTransition,
            // child: Scaffold(
            //   body: Text(bookId),
            // ),
            child: InitPage(
              code: bookId,
            ),
          );
        }
      },
    ),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<ThemeNotifier>(builder: (context, theme, _) {
          return MaterialApp.router(
            routeInformationParser: BeamerParser(),
            routerDelegate: routerDelegate,
            theme: theme.getTheme(),
          );
        });
      },
    );
  }
}
