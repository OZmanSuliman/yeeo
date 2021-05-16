/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Created on Fri May 14 2021
 *
 * Copyright (c) 2021 Osman Suliman
 * oz.solomon99@gmail.com
 */

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:yeeo/views/pages/intro/splash.dart';
import 'package:yeeo/views/theme/appTheme.dart';

import 'core/providers/addOfferProvider.dart';
import 'core/providers/loginProvider.dart';
import 'core/providers/mediaPickerProvider.dart';
import 'core/providers/pagerProvider.dart';
import 'core/providers/signupProvider.dart';
import 'core/providers/splashProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(Phoenix(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddOfferProvider()),
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
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
