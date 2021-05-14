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
            padding: EdgeInsetsResponsive.fromLTRB(15, 10, 15, 10),
            color: appTheme().primaryColor,
            child: Text(
              "Language".tr(),
              style: TextStyle(
                  fontWeight: context.locale == Locale("ar")
                      ? FontWeight.bold
                      : FontWeight.normal),
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
            context.locale = Locale(val);
            Phoenix.rebirth(context);
          },
        ),
      ),
    );
  }
}
