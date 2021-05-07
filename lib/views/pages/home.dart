import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/views/theme/appTheme.dart';

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsetsResponsive.fromLTRB(15, 10, 15, 10),
                        color: appTheme().primaryColor,
                        child: Text("Language"),
                      ),
                      SizedBox(
                        width: 50.w,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      Container(
                        padding: EdgeInsetsResponsive.all(10),
                        child: Text("job describtion"),
                      ),
                    ],
                  ),
                  Container(
                    height: height - 200.h,
                    width: width - 50.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: appTheme().primaryColor, width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsResponsive.all(28),
                          padding: EdgeInsetsResponsive.only(right: 5, left: 5),
                          decoration: BoxDecoration(
                              color: appTheme().primaryColorLight,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 120.h,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            maxLines: null,
                          ),
                        ),
                        Container(
                          margin: EdgeInsetsResponsive.fromLTRB(30, 0, 30, 10),
                          height: 50.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appTheme().primaryColor, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 25.w,
                                height: 25.h,
                                color: Colors.grey[300],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 25.w,
                                height: 25.h,
                                color: Colors.grey[300],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 25.w,
                                height: 25.h,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150.h,
                          width: width - 150,
                          child: GridView(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 42 / 40,
                                    crossAxisCount: 2),
                            children: <Widget>[
                              Container(
                                margin: EdgeInsetsResponsive.all(10),
                                width: 40.w,
                                height: 40.h,
                                color: Colors.grey[300],
                              ),
                              Container(
                                margin: EdgeInsetsResponsive.all(10),
                                width: 40.w,
                                height: 40.h,
                                color: Colors.grey[300],
                              ),
                              Container(
                                margin: EdgeInsetsResponsive.all(10),
                                width: 40.w,
                                height: 40.h,
                                color: Colors.grey[300],
                              ),
                              Container(
                                margin: EdgeInsetsResponsive.all(10),
                                width: 40.w,
                                height: 40.h,
                                color: Colors.grey[300],
                              ),
                              Container(
                                margin: EdgeInsetsResponsive.all(10),
                                width: 40.w,
                                height: 40.h,
                                color: Colors.grey[300],
                              ),
                              Container(
                                margin: EdgeInsetsResponsive.all(10),
                                width: 40.w,
                                height: 40.h,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: appTheme().primaryColor,
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.black,
                                        size: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("Duration"),
                                  ],
                                ),
                                Text("10 Days"),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 15.w,
                                      height: 15.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Text(
                                        "\$",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("Budget"),
                                  ],
                                ),
                                Text("1000 AED"),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("Location"),
                                  ],
                                ),
                                Text("Dubai, Deira"),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsetsResponsive.fromLTRB(30, 10, 30, 10),
                          height: 30.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appTheme().primaryColor, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Send"),
                              Transform.rotate(
                                angle: 5,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  width: 15,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
