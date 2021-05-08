import 'package:flutter/material.dart';
import 'package:yeeo/views/pages/splash.dart';
import 'package:yeeo/views/theme/appTheme.dart';
import 'package:provider/provider.dart';
import 'core/providers/homeProvider.dart';
import 'core/providers/loginProvider.dart';
import 'core/providers/signupProvider.dart';
import 'core/providers/splashProvider.dart';
import 'package:easy_localization/easy_localization.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path: 'translations',
        fallbackLocale: Locale('ar'),
        child: MaterialApp(
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          home: Splash(),
        ),
      ),
    ));
