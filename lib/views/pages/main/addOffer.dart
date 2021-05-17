/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Created on Fri May 14 2021
 *
 * Copyright (c) 2021 Osman Suliman
 * oz.solomon99@gmail.com
 */
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/addOfferProvider.dart';
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
    Provider.of<AddOfferProvider>(context, listen: false).userLogged();
  }

  @override
  Widget build(BuildContext context) {
    AddOfferProvider provider =
        Provider.of<AddOfferProvider>(context, listen: true);
    AddOfferProvider providerFunc =
        Provider.of<AddOfferProvider>(context, listen: false);
    var width = MediaQuery.of(context).size.width;
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
              key: Provider.of<AddOfferProvider>(context, listen: false)
                  .homeFormKey,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("Yeeo",
                              style: TextStyle(
                                  fontFamily: "Salsa-Regular",
                                  fontSize: ScreenUtil().setSp(30))),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
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
                            child: Text(
                              "job describtion".tr(),
                              style: TextStyle(
                                  fontFamily: "Tharlon-Regular",
                                  fontSize: ScreenUtil().setSp(17),
                                  fontWeight: context.locale == Locale("ar")
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 4.5 * width / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                                color: appTheme().primaryColor, width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsResponsive.all(20),
                              padding: EdgeInsetsResponsive.only(
                                  right: context.locale == Locale("ar") ? 6 : 0,
                                  left: context.locale != Locale("ar") ? 6 : 0,
                                  top: 0),
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
                                    contentPadding: EdgeInsets.all(0),
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
                                        Provider.of<AddOfferProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 0,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img1 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png',
                                            )
                                          : Image.file(
                                              Provider.of<AddOfferProvider>(
                                                      context,
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
                                        Provider.of<AddOfferProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 1,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img2 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png')
                                          : Image.file(
                                              Provider.of<AddOfferProvider>(
                                                      context,
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
                                        Provider.of<AddOfferProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 2,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img3 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png')
                                          : Image.file(
                                              Provider.of<AddOfferProvider>(
                                                      context,
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
                                        Provider.of<AddOfferProvider>(context,
                                                listen: false)
                                            .updateImage(
                                                index: 3,
                                                selectedImage: pickedFile);
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      child: Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img4 ==
                                              null
                                          ? Image.asset(
                                              'assets/images/addImg.png')
                                          : Image.file(
                                              Provider.of<AddOfferProvider>(
                                                      context,
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
                            CarouselSlider(
                              options: CarouselOptions(
                                  height: 120.h,
                                  autoPlay: false,
                                  enlargeCenterPage: false,
                                  viewportFraction: 0.33,
                                  // aspectRatio: 2,
                                  initialPage: 0,
                                  onPageChanged: (index, reason) =>
                                      providerFunc.changeSlider(index)),
                              items: provider.categories.map((i) {
                                // ignore: unused_local_variable
                                int index = provider.categories.indexOf(i);
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin:
                                                EdgeInsetsResponsive.all(10),
                                            width: 40.w,
                                            height: 40.h,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                EdgeInsetsResponsive.all(10),
                                            width: 40.w,
                                            height: 40.h,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: provider.categories.map((i) {
                                int index = provider.categories.indexOf(i);
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ClipRRect(
                                    borderRadius: new BorderRadius.all(
                                      Radius.circular(360),
                                    ),
                                    child: Container(
                                      width: 6.0,
                                      height: 9.0,
                                      decoration: BoxDecoration(
                                        color:
                                            provider.currentSliderIndex == index
                                                ? appTheme().primaryColor
                                                : appTheme().primaryColorLight,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
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
                                                  fontWeight: context.locale ==
                                                          Locale("ar")
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  fontFamily: "Salsa-Regular"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                      width: 140.w,
                                      padding: EdgeInsetsResponsive.all(8.0),
                                      child: TextFormField(
                                        expands: false,
                                        textAlign: TextAlign.start,
                                        controller: provider.durationController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            hintText: "Duration".tr(),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontFamily: "Salsa-Regular")),
                                        validator: Validator.validateEmptiness,
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12),
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
                                                  fontFamily: "Salsa-Regular",
                                                  fontWeight: context.locale ==
                                                          Locale("ar")
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                      width: 140.w,
                                      padding: EdgeInsetsResponsive.all(8.0),
                                      child: TextFormField(
                                        expands: false,
                                        textAlign: TextAlign.start,
                                        controller: provider.budgetController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            hintText: "Budget".tr(),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontFamily: "Salsa-Regular")),
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12),
                                            fontFamily: "Salsa-Regular"),
                                        validator: Validator.validateEmptiness,
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
                                                fontFamily: "Salsa-Regular",
                                                fontWeight: context.locale ==
                                                        Locale("ar")
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                      width: 140.w,
                                      padding: EdgeInsetsResponsive.all(8.0),
                                      child: DropdownButtonFormField(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.blue,
                                        ),
                                        validator: Validator.validateDropDown,
                                        hint: Container(
                                          padding: EdgeInsetsResponsive.only(
                                              bottom: 8.0),
                                          child: Text(
                                              provider?.selectedCity?.tr() ??
                                                  "select city".tr(),
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(12),
                                                  fontFamily: "Salsa-Regular")),
                                        ),
                                        items: [
                                          "Abu Dhabi",
                                          "Ras Al Khaimah",
                                          "Dubai",
                                          "Sharjah",
                                          "Ajman",
                                          "Umm Al-Quwain",
                                          "Fujairah",
                                        ].map((String city) {
                                          return new DropdownMenuItem<String>(
                                            value: city,
                                            child: new Text(city.tr(),
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(12),
                                                    fontFamily:
                                                        "Salsa-Regular")),
                                          );
                                        }).toList(),
                                        onChanged: (city) {
                                          providerFunc.changeCity(city);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (Provider.of<AddOfferProvider>(context,
                                        listen: false)
                                    .homeFormKey
                                    .currentState
                                    .validate()) {
                                  Provider.of<AddOfferProvider>(context,
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
                                            fontFamily: "Salsa-Regular",
                                            fontWeight:
                                                context.locale == Locale("ar")
                                                    ? FontWeight.bold
                                                    : FontWeight.normal)),
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
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
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
