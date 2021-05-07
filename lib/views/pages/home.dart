import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeeo/core/providers/homeProvider.dart';

class HomePage extends StatefulWidget {
  final String email;

  HomePage({Key key, @required this.email}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text(
          "logout",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () =>
            Provider.of<HomeProvider>(context, listen: false).logout(context),
      )),
    );
  }
}
