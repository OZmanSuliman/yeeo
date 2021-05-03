import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yeeo/views/theme/appTheme.dart';

load(var _height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        width: _height - 20,
        height: _height - 20,
        child: FlareActor("assets/flrs/loadingCircles.flr",
            alignment: Alignment.center,
            fit: BoxFit.cover,
            color: appTheme().primaryColor,
            animation: "Loading"),
      ),
      Text('Loading')
    ],
  );
}

imageLoad(_height) {
  return SizedBox(
    width: _height - 20,
    height: _height - 20,
    child: FlareActor("assets/flrs/loadingCircles.flr",
        color: appTheme().primaryColor,
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "Loading"),
  );
}

tinyLoad(_height) {
  return SizedBox(
    width: _height - 20,
    height: _height - 20,
    child: FlareActor("assets/flrs/loadingCircles.flr",
        color: appTheme().primaryColor,
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "Loading"),
  );
}
