import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/loginProvider.dart';
import 'package:yeeo/views/theme/appTheme.dart';

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
          GestureDetector(
              onTap: () => Provider.of<LoginProvider>(context, listen: false)
                  .switchType(1),
              child: Row(
                children: [
                  AnimatedBuilder(
                    animation: provider.arrowAnimationController1,
                    builder: (context, child) => Transform.rotate(
                      angle: provider.arrowAnimation1.value,
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "User",
                    style: TextStyle(
                        color: provider.userType == 1
                            ? appTheme().primaryColor
                            : Colors.black),
                  ),
                ],
              )),
          Container(
            color: Colors.grey,
            width: 2,
            height: 18,
            margin: EdgeInsetsResponsive.only(right: 10, left: 10),
          ),
          GestureDetector(
              onTap: () => Provider.of<LoginProvider>(context, listen: false)
                  .switchType(2),
              child: Row(
                children: [
                  Text(
                    "Service Provider",
                    style: TextStyle(
                      color: provider.userType == 2
                          ? appTheme().primaryColorDark
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AnimatedBuilder(
                    animation: provider.arrowAnimationController2,
                    builder: (context, child) => Transform.rotate(
                      angle: provider.arrowAnimation2.value,
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
