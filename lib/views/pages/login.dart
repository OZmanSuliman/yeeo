import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/loginProvider.dart';
import 'package:yeeo/core/utils/validator.dart';
import 'package:yeeo/views/Animation/FadeAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:yeeo/views/theme/appTheme.dart';
import 'package:yeeo/views/widgets/userType.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  initAnimation() {
    Provider.of<LoginProvider>(context, listen: false)
            .arrowAnimationController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    Provider.of<LoginProvider>(context, listen: false).arrowAnimation1 =
        Tween(begin: 0.0, end: pi).animate(
            Provider.of<LoginProvider>(context, listen: false)
                .arrowAnimationController1);

    Provider.of<LoginProvider>(context, listen: false)
            .arrowAnimationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    Provider.of<LoginProvider>(context, listen: false).arrowAnimation2 =
        Tween(begin: 0.0, end: pi).animate(
            Provider.of<LoginProvider>(context, listen: false)
                .arrowAnimationController2);
    if (Provider.of<LoginProvider>(context, listen: false).userType == 1) {
      Provider.of<LoginProvider>(context, listen: false)
          .arrowAnimationController1
          .reverse();
      Provider.of<LoginProvider>(context, listen: false)
          .arrowAnimationController2
          .forward();
    } else {
      Provider.of<LoginProvider>(context, listen: false)
          .arrowAnimationController2
          .reverse();
      Provider.of<LoginProvider>(context, listen: false)
          .arrowAnimationController1
          .forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context, listen: true);
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
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: Provider.of<LoginProvider>(context, listen: false).loginFormKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    height: 350.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                    child: FadeAnimation(
                        1.6,
                        Stack(
                          children: [
                            Positioned(
                              left: 30.w,
                              width: 80.w,
                              height: 200.h,
                              child: FadeAnimation(
                                  1,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/light-1.png'))),
                                  )),
                            ),
                            Positioned(
                              left: 140.w,
                              width: 80.w,
                              height: 150.h,
                              child: FadeAnimation(
                                  1.3,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/light-2.png'))),
                                  )),
                            ),
                            Positioned(
                              right: 40.w,
                              top: 40.h,
                              width: 80.w,
                              height: 150.h,
                              child: FadeAnimation(
                                  1.5,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/clock.png'))),
                                  )),
                            ),
                            Positioned(
                              child: FadeAnimation(
                                  1.6,
                                  Container(
                                    margin: EdgeInsetsResponsive.only(top: 50),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(40),
                                            fontFamily: "Salsa",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ))),
                Padding(
                  padding:
                      EdgeInsetsResponsive.only(left: 30.0, right: 30, top: 25),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsetsResponsive.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: <Widget>[
                                UserTypeWidget(),
                                Container(
                                  padding: EdgeInsetsResponsive.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    controller: provider.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Email",
                                        labelStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    validator: Validator.validateEmail,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  padding: EdgeInsetsResponsive.all(8.0),
                                  child: TextFormField(
                                      controller: provider.passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator:
                                          Validator.validatePasswordLength),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                      FadeAnimation(
                          2,
                          GestureDetector(
                            onTap: () {
                              Provider.of<LoginProvider>(context, listen: false)
                                  .login(context);
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    appTheme().primaryColor,
                                    appTheme().primaryColor,
                                  ])),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                      FadeAnimation(
                          1.5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New User?  ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: SignupPage()));
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: appTheme().primaryColor),
                                  )),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
