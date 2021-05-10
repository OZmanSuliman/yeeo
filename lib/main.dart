import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:yeeo/views/pages/intro/splash.dart';
import 'package:yeeo/views/theme/appTheme.dart';

import 'core/providers/homeProvider.dart';
import 'core/providers/loginProvider.dart';
import 'core/providers/mediaPickerProvider.dart';
import 'core/providers/pagerProvider.dart';
import 'core/providers/signupProvider.dart';
import 'core/providers/splashProvider.dart';

void main() => runApp(Phoenix(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => SignUpProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => MediaPickerProvider()),
          ChangeNotifierProvider(create: (_) => SplashProvider()),
          ChangeNotifierProvider(create: (_) => PagerProvider()),
        ],
        child: EasyLocalization(
            supportedLocales: [Locale('ar'), Locale('en')],
            path: 'translations',
            fallbackLocale: Locale('ar'),
            child: MyApp()),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
