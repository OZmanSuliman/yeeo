import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/loginProvider.dart';
import 'package:easy_localization/easy_localization.dart';

class UserTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginProvider provider =
        Provider.of<LoginProvider>(context, listen: true);
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 60.w,
          ),
          GestureDetector(
              onTap: () => Provider.of<LoginProvider>(context, listen: false)
                  .switchType(1),
              child: Row(
                children: [
                  Text(
                    "User".tr(),
                    style: TextStyle(
                        decoration: provider.userType == 1
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsetsResponsive.only(bottom: 8.0),
                    child: Transform.rotate(
                      angle: 3,
                      child: Image.asset(
                        provider.userType == 1
                            ? "assets/images/logo.png"
                            : "assets/images/logo_white.png",
                        width: 20,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              )),
          GestureDetector(
              onTap: () => Provider.of<LoginProvider>(context, listen: false)
                  .switchType(2),
              child: Row(
                children: [
                  Image.asset(
                    provider.userType == 2
                        ? "assets/images/logo.png"
                        : "assets/images/logo_white.png",
                    width: 20,
                    height: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Service Provider".tr(),
                    style: TextStyle(
                      decoration: provider.userType == 2
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
