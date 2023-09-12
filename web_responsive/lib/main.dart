import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/routes/router.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:meta_seo/meta_seo.dart';

import 'core/components/locale.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: bgColor,
  ));

  if (kIsWeb) {
      // await Firebase.initializeApp(
      //   options: const FirebaseOptions(
      //       // apiKey: "",
      //       // authDomain: "",
      //       // projectId: "",
      //       // storageBucket: "",
      //       // messagingSenderId: "",
      //       // appId: "",
      //       // measurementId: ""),
      // );
    MetaSEO().config();
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UtilAppLocale(),
      child: Consumer<UtilAppLocale>(
        builder: (context, locale, child) {
          return MaterialApp.router(
            routeInformationParser: goRouter.routeInformationParser,
            routeInformationProvider: goRouter.routeInformationProvider,
            routerDelegate: goRouter.routerDelegate,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            locale: locale.locale,
            title: 'Gabriel Codigo',
            theme: ThemeData.dark().copyWith(
              primaryColor: primaryColor,
              scaffoldBackgroundColor: bgColor,
              canvasColor: bgColor,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .apply(bodyColor: Colors.white)
                      .copyWith(
                        bodyLarge: const TextStyle(color: bodyTextColor),
                        bodyMedium: const TextStyle(color: bodyTextColor),
                      ),
            ),
          );
        },
      ),
    );
  }
}


// flutter build web --web-renderer canvaskit
