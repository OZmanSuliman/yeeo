import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mytest/core/providers/homeProvider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  final String email;

  HomePage({Key key, @required this.email}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: provider.img != null
            ? CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.transparent,
                backgroundImage: FileImage(File(provider.img)),
              )
            : Icon(Icons.error),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome ${provider.firstname}',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final form = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  "${provider.firstname} ${provider.lastname}",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.mail,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  widget.email,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.cake,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  provider.birthday,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.phone,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  provider.phones,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.home_work,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  provider.addresses,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(143, 148, 251, 1),
          Color.fromRGBO(143, 148, 251, .7),
        ]),
      ),
      child: Column(
        children: <Widget>[
          alucard,
          SizedBox(
            height: 20,
          ),
          welcome,
          SizedBox(
            height: 20,
          ),
          form,
          Expanded(child: Container()),
          GestureDetector(
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: LoginPage()));
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.white70,
                  ])),
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
