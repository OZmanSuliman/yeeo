import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/homeProvider.dart';
import 'package:yeeo/core/utils/validator.dart';
import 'package:yeeo/views/theme/appTheme.dart';
import 'package:yeeo/views/widgets/languages.dart';
import 'package:yeeo/views/widgets/mediaPicker.dart';

class AddOffer extends StatefulWidget {
  AddOffer();
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);

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
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key:
                  Provider.of<HomeProvider>(context, listen: false).homeFormKey,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset('assets/images/addOfferBanner.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LanguageWidget(),
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
                            child: Text("job describtion".tr()),
                          ),
                        ],
                      ),
                      Container(
                        height: height - 220.h,
                        width: width - 50.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: appTheme().primaryColor, width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsResponsive.all(20),
                              padding:
                                  EdgeInsetsResponsive.only(right: 5, left: 5),
                              decoration: BoxDecoration(
                                  color: appTheme().primaryColorLight,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 120.h,
                              child: TextFormField(
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.multiline,
                                controller: provider.noteController,
                                minLines: 5,
                                decoration: InputDecoration(
                                    hintText: "description".tr(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    )),
                                validator: Validator.validateEmptiness,
                                maxLines: null,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsetsResponsive.fromLTRB(30, 0, 30, 10),
                              height: 50.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: appTheme().primaryColor, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      var pickedFile = await showDialog(
                                          context: context,
                                          builder: (context) =>
                                              MediaPickDialog());
                                      if (pickedFile != null) {
                                        Provider.of<HomeProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 0,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img1 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png',
                                            )
                                          : Image.file(
                                              Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img1,
                                              fit: BoxFit.cover,
                                            ),
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      var pickedFile = await showDialog(
                                          context: context,
                                          builder: (context) =>
                                              MediaPickDialog());
                                      if (pickedFile != null) {
                                        Provider.of<HomeProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 1,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img2 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png')
                                          : Image.file(
                                              Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img2,
                                              fit: BoxFit.cover,
                                            ),
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      var pickedFile = await showDialog(
                                          context: context,
                                          builder: (context) =>
                                              MediaPickDialog());
                                      if (pickedFile != null) {
                                        Provider.of<HomeProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 2,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img3 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png')
                                          : Image.file(
                                              Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img3,
                                              fit: BoxFit.cover,
                                            ),
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      var pickedFile = await showDialog(
                                          context: context,
                                          builder: (context) =>
                                              MediaPickDialog());
                                      if (pickedFile != null) {
                                        Provider.of<HomeProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 3,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img4 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png')
                                          : Image.file(
                                              Provider.of<HomeProvider>(context,
                                                      listen: true)
                                                  .img4,
                                              fit: BoxFit.cover,
                                            ),
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 120.h,
                              width: width - 150,
                              child: Scrollbar(
                                child: GridView(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      EdgeInsetsResponsive.only(left: 20.w),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 42 / 50,
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
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Container(
                                      width: 90.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            'assets/images/duration.png',
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: AutoSizeText(
                                              "Duration".tr(),
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: "Salsa-Regular"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    Container(
                                      width: 140.w,
                                      height: 30.h,
                                      padding: EdgeInsetsResponsive.all(8.0),
                                      child: TextFormField(
                                        textAlign: TextAlign.start,
                                        controller: provider.durationController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.blue,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "Duration".tr(),
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontFamily: "Salsa-Regular")),
                                        validator: Validator.validateEmptiness2,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Salsa-Regular"),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Container(
                                      width: 90.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            'assets/images/budget.png',
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: AutoSizeText(
                                              "Budget".tr(),
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: "Salsa-Regular"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    Container(
                                      width: 140.w,
                                      height: 30.h,
                                      padding: EdgeInsetsResponsive.all(8.0),
                                      child: TextFormField(
                                        textAlign: TextAlign.start,
                                        controller: provider.budgetController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.blue,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "Budget".tr(),
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontFamily: "Salsa-Regular")),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Salsa-Regular"),
                                        validator: Validator.validateEmptiness2,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Container(
                                      width: 90.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            'assets/images/location.png',
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                              child: AutoSizeText(
                                            "Location".tr(),
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily: "Salsa-Regular"),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    Container(
                                      width: 140.w,
                                      height: 30.h,
                                      padding: EdgeInsetsResponsive.all(8.0),
                                      child: TextFormField(
                                        textAlign: TextAlign.start,
                                        controller: provider.locationController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.blue,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "Location".tr(),
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontFamily: "Salsa-Regular")),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Salsa-Regular"),
                                        validator: Validator.validateEmptiness2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (Provider.of<HomeProvider>(context,
                                        listen: false)
                                    .homeFormKey
                                    .currentState
                                    .validate()) {
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .send(context);
                                }
                              },
                              child: Container(
                                margin: EdgeInsetsResponsive.fromLTRB(
                                    30, 10, 30, 10),
                                height: 30.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: appTheme().primaryColor,
                                        width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Send".tr(),
                                        style: TextStyle(
                                            fontFamily: "Salsa-Regular")),
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
        ),
      ),
    );
  }
}
