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
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/models/languages.dart';
import 'package:yeeo/views/theme/appTheme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 725.0,
      width: 360.0,
      allowFontScaling: true,
    );
    return ResponsiveWidgets.builder(
      height: 725.0,
      width: 360.0,
      allowFontScaling: true,
      child: Container(
        child: DropdownButton(
          icon: Container(),
          underline: SizedBox(),
          hint: Container(
            width: 100.w,
            alignment: Alignment.center,
            color: appTheme().primaryColor,
            child: Text(
              "Language".tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          items: getLanguages.map((Language lang) {
            return new DropdownMenuItem<String>(
              value: lang.languageCode,
              child: new Text(lang.name),
            );
          }).toList(),
          onChanged: (val) {
            print(val);
            if (context.locale != Locale(val)) {
              context.locale = Locale(val);
              Phoenix.rebirth(context);
            }
          },
        ),
      ),
    );
  }
}
