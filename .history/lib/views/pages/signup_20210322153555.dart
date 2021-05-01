import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mytest/core/providers/signupProvider.dart';
import 'package:mytest/views/Animation/FadeAnimation.dart';

import 'package:provider/provider.dart';

import '../widgets/dialogs.dart';
import '../widgets/responsive_ui.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    Provider.of<SignUpProvider>(context, listen: false).getUser();
    super.initState();
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
                            image: AssetImage('assets/images/signup.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        // Positioned(
                        //   child: FadeAnimation(1.6, Container(
                        //     margin: EdgeInsets.only(bottom: 40),
                        //     child: Center(
                        //       child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        //     ),
                        //   )),
                        // ),

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
                                      //height: _height / 6.5,
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
                                              color: Colors.orange[200],
                                            )
                                          : CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              backgroundImage:
                                                  provider.isImage == 1
                                                      ? FileImage(provider.img)
                                                      : null,
                                              radius: 150.0,
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
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      controller: provider.fNameController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "First name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      controller: provider.lNameController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Last name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: provider.emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: provider.passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: provider.birthdayController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Add birthday",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          suffixIcon: GestureDetector(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.add_circle_outlined,
                                                color: Colors.amber,
                                              ),
                                              onPressed: () {
                                                Provider.of<SignUpProvider>(
                                                        context,
                                                        listen: false)
                                                    .selectDate(context);
                                              },
                                            ),
                                          )),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: provider.phoneController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Add a phone number",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          suffixIcon: GestureDetector(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.add_circle_outlined,
                                                color: Colors.amber,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  provider.phones.add(provider
                                                      .phoneController.text);
                                                });
                                                provider.phoneController
                                                    .clear();
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
                                              left: 12.0, right: 12, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(provider.phones[index]),
                                              GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      provider.phones
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ))
                                            ],
                                          ),
                                        );
                                      }),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: provider.addressController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Add an address",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          suffixIcon: GestureDetector(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.add_circle_outlined,
                                                color: Colors.amber,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  provider.addresses.add(
                                                      provider.addressController
                                                          .text);
                                                });
                                                provider.addressController
                                                    .clear();
                                              },
                                            ),
                                          )),
                                    ),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: provider.addresses.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 12, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(provider.addresses[index]),
                                              GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      provider.addresses
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ))
                                            ],
                                          ),
                                        );
                                      }),
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
                                                activeColor: Colors.amber,
                                                groupValue: 1,
                                                onChanged: (int value) {
                                                  setState(() {
                                                    provider.type = "male";
                                                  });
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
                                                activeColor: Colors.amber,
                                                groupValue: 1,
                                                onChanged: (int value) {
                                                  setState(() {
                                                    provider.type = "female";
                                                  });
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
                                if (Provider.of<SignUpProvider>(context,
                                        listen: false)
                                    .signFormKey
                                    .currentState
                                    .validate()) {
                                  if (provider.img == null) {
                                    Dialogs d = new Dialogs();
                                    d.wrong("Please select an image", context);
                                  } else if (provider.phones.length < 1) {
                                    Dialogs d = new Dialogs();
                                    d.wrong(
                                        "Please add at least one phone number",
                                        context);
                                  } else if (provider.addresses.length < 1) {
                                    Dialogs d = new Dialogs();
                                    d.wrong("Please add at least one address",
                                        context);
                                  } else {
                                    provider.onSignUp(context);
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
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
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1)),
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
              //borderRadius: BorderRadius.only(topLeft:  Radius.circular(25.0), topRight:  Radius.circular(25.0)),
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
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Gallery"),
                            SizedBox(
                              height: 10,
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
                                Icons.camera,
                                size: 40,
                                color: Colors.cyan,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Camera"),
                            SizedBox(
                              height: 10,
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
