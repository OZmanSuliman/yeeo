import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/signupProvider.dart';
import 'package:yeeo/core/utils/validator.dart';
import 'package:yeeo/views/theme/appTheme.dart';
import 'package:easy_localization/easy_localization.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SignUpProvider provider =
        Provider.of<SignUpProvider>(context, listen: true);
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
          backgroundColor: Colors.white,
          body: Form(
            key:
                Provider.of<SignUpProvider>(context, listen: false).signFormKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/signup_background.png'),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsetsResponsive.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsetsResponsive.only(top: 100.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/images/logo.png',
                                  width: 50.w,
                                  height: 50.h,
                                ),
                                SizedBox(
                                  width: 20.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60.w,
                          ),
                          Container(
                            padding: EdgeInsetsResponsive.all(0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.h,
                                  child: Center(
                                    child: Text(
                                      "Sign up !".tr(),
                                      style: TextStyle(
                                          fontFamily: "Salsa",
                                          fontSize: ScreenUtil().setSp(30),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 200.w,
                                          height: 40.h,
                                          padding:
                                              EdgeInsetsResponsive.all(8.0),
                                          child: TextFormField(
                                            controller:
                                                provider.userNameController,
                                            decoration: InputDecoration(
                                                border: new OutlineInputBorder(
                                                    borderSide: new BorderSide(
                                                        color: Colors.black)),
                                                labelText: "username".tr(),
                                                labelStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                            validator: Validator.validateName,
                                          ),
                                        ),
                                        Container(
                                          width: 200.w,
                                          height: 40.h,
                                          padding:
                                              EdgeInsetsResponsive.all(8.0),
                                          child: TextFormField(
                                              controller:
                                                  provider.passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  border:
                                                      new OutlineInputBorder(
                                                          borderSide:
                                                              new BorderSide(
                                                                  color: Colors
                                                                      .black)),
                                                  labelText: "Password".tr(),
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey[400])),
                                              validator: Validator
                                                  .validatePasswordLength),
                                        ),
                                        Container(
                                          width: 200.w,
                                          height: 40.h,
                                          padding:
                                              EdgeInsetsResponsive.all(8.0),
                                          child: TextFormField(
                                            controller: provider
                                                .confirmPasswordController,
                                            obscureText: true,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            decoration: InputDecoration(
                                                border: new OutlineInputBorder(
                                                    borderSide: new BorderSide(
                                                        color: Colors.black)),
                                                labelText:
                                                    "Confirm Passowrd".tr(),
                                                labelStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                            validator: Validator
                                                .validatePasswordLength,
                                          ),
                                        ),
                                        Container(
                                          width: 200.w,
                                          height: 40.h,
                                          padding:
                                              EdgeInsetsResponsive.all(8.0),
                                          child: TextFormField(
                                            controller:
                                                provider.emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                                border: new OutlineInputBorder(
                                                    borderSide: new BorderSide(
                                                        color: Colors.black)),
                                                labelText: "Email".tr(),
                                                labelStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                            validator: Validator.validateEmail,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 65.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        provider.onSignUpTap(context);
                                      },
                                      child: Container(
                                        height: 30.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                            color: appTheme().primaryColor,
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: Center(
                                          child: Text(
                                            "Submit".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 65.w,
                                    ),
                                    GestureDetector(
                                      onTap: () => Provider.of<SignUpProvider>(
                                              context,
                                              listen: false)
                                          .onTapAcceept(),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(360),
                                            border: Border.all(
                                                color: Colors.black)),
                                        width: 20.w,
                                        height: 17.h,
                                        child: provider.accepted
                                            ? Icon(
                                                Icons.check,
                                                size: ScreenUtil().setSp(15),
                                              )
                                            : Container(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text("Terms & Conditions".tr(),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: ScreenUtil().setSp(14))),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
