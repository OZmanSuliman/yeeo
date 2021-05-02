import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yeeo/core/providers/loginProvider.dart';
import 'package:yeeo/core/providers/signupProvider.dart';
import 'package:yeeo/core/utils/validator.dart';
import 'package:yeeo/views/Animation/FadeAnimation.dart';
import 'package:provider/provider.dart';
import 'package:yeeo/views/theme/appTheme.dart';
import 'package:yeeo/views/widgets/userType.dart';
import '../widgets/responsive_ui.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
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
    double _width = MediaQuery.of(context).size.width;
    double _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    bool _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    bool _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    SignUpProvider provider =
        Provider.of<SignUpProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: Provider.of<SignUpProvider>(context, listen: false)
                  .signFormKey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: FadeAnimation(
                              1.6,
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      mediaSheet();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 50),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 0.0,
                                              color: Colors.black26,
                                              offset: Offset(1.0, 10.0),
                                              blurRadius: 20.0),
                                        ],
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: provider.isImage != 1
                                          ? Icon(
                                              Icons.add_a_photo,
                                              size: _large
                                                  ? 40
                                                  : (_medium ? 33 : 31),
                                              color: appTheme().primaryColor,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                Radius.circular(360),
                                              ),
                                              child: Image.file(
                                                provider.img,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: <Widget>[
                                  UserTypeWidget(),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      controller: provider.firstNameController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "First name",
                                          labelStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: Validator.validateName,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      controller: provider.lastNameController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Last name",
                                          labelStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: Validator.validateName,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
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
                                          labelStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: Validator.validateEmail,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
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
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      controller: provider.birthdayController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "DOB",
                                          labelStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          suffixIcon: GestureDetector(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.calendar_today_outlined,
                                                color: appTheme().primaryColor,
                                              ),
                                              onPressed: () {
                                                Provider.of<SignUpProvider>(
                                                        context,
                                                        listen: false)
                                                    .selectDate(context);
                                              },
                                            ),
                                          )),
                                      validator: Validator.validateDOB,
                                    ),
                                  ),
                                  Form(
                                    key: Provider.of<SignUpProvider>(context,
                                            listen: false)
                                        .phoneFormKey,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[100]))),
                                          child: TextFormField(
                                            controller:
                                                provider.phoneController,
                                            keyboardType: TextInputType.phone,
                                            validator: Validator.validateMobile,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelText: "phone number",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey[400]),
                                                suffixIcon: GestureDetector(
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.add_call,
                                                      color: appTheme()
                                                          .primaryColor,
                                                    ),
                                                    onPressed: () {
                                                      if (provider.phoneFormKey
                                                          .currentState
                                                          .validate()) {
                                                        provider.addPhone();
                                                      }
                                                    },
                                                  ),
                                                )),
                                          ),
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: provider.phones.length,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0,
                                                    right: 12,
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        provider.phones[index]),
                                                    GestureDetector(
                                                        onTap: () {
                                                          provider.deletePhone(
                                                              index);
                                                        },
                                                        child: Text(
                                                          'X',
                                                          style: TextStyle(
                                                              fontSize: 19,
                                                              color:
                                                                  Colors.red),
                                                        ))
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                  Form(
                                    key: Provider.of<SignUpProvider>(context,
                                            listen: false)
                                        .addressFormKey,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[100]))),
                                          child: TextFormField(
                                            controller:
                                                provider.addressController,
                                            validator:
                                                Validator.validateAddress,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelText: "Address",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey[400]),
                                                suffixIcon: GestureDetector(
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.add_business,
                                                      color: appTheme()
                                                          .primaryColor,
                                                    ),
                                                    onPressed: () {
                                                      if (provider
                                                          .addressFormKey
                                                          .currentState
                                                          .validate()) {
                                                        provider.addAddress();
                                                      }
                                                    },
                                                  ),
                                                )),
                                          ),
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                provider.addresses.length,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0,
                                                    right: 12,
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(provider
                                                        .addresses[index]),
                                                    GestureDetector(
                                                        onTap: () {
                                                          provider
                                                              .deleteAddress(
                                                                  index);
                                                        },
                                                        child: Text(
                                                          'X',
                                                          style: TextStyle(
                                                              fontSize: 19,
                                                              color:
                                                                  Colors.red),
                                                        ))
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio<int>(
                                                value: provider.type == 'male'
                                                    ? 1
                                                    : 2,
                                                activeColor:
                                                    appTheme().primaryColor,
                                                groupValue: 1,
                                                onChanged: (int value) {
                                                  provider.selectGender('male');
                                                }),
                                            Text(
                                              'Male',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio<int>(
                                                value: provider.type == 'female'
                                                    ? 1
                                                    : 2,
                                                activeColor:
                                                    appTheme().primaryColor,
                                                groupValue: 1,
                                                onChanged: (int value) {
                                                  provider
                                                      .selectGender('female');
                                                }),
                                            Text(
                                              'Female',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            2,
                            GestureDetector(
                              onTap: () {
                                provider.onSignUpTap(context);
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      appTheme().primaryColor,
                                      appTheme().primaryColor,
                                    ])),
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?  ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: appTheme().primaryColor),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void mediaSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 160,
            child: Material(
              color: Colors.white,
              animationDuration: Duration(milliseconds: 500),
              elevation: 0.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Provider.of<SignUpProvider>(context, listen: false)
                          .pickerGallary(1);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0, left: 30, right: 30),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              child: Icon(
                                Icons.image,
                                size: 40,
                                color: appTheme().primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<SignUpProvider>(context, listen: false)
                          .pickerGallary(0);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0, left: 30, right: 30),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              child: Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: appTheme().primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
