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
import 'package:flutter_svg/flutter_svg.dart';
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
      height: 896.0,
      width: 414.0,
      allowFontScaling: true,
    );
    return ResponsiveWidgets.builder(
      height: 896.0,
      width: 414.0,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsetsResponsive.only(left: 17.0),
                          child: Text("Yeeo",
                              style: TextStyle(
                                  fontFamily: "Salsa-Regular",
                                  fontSize: ScreenUtil().setSp(30))),
                        ),
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
                                  fontWeight: FontWeight.w600),
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
                              margin:
                                  EdgeInsetsResponsive.fromLTRB(33, 44, 37, 32),
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
                              height: 205.h,
                              child: TextFormField(
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.multiline,
                                controller: provider.noteController,
                                minLines: 5,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                            Row(
                              children: [
                                SizedBox(
                                  width: 48.w,
                                ),
                                Text(
                                  "Add image",
                                  style: TextStyle(
                                      fontFamily: "Salsa-Regular",
                                      fontSize: ScreenUtil().setSp(12),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  EdgeInsetsResponsive.fromLTRB(38, 2, 45, 17),
                              height: 44.h,
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
                                      if (Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .img4 ==
                                          null) {
                                        var pickedFile = await showDialog(
                                            context: context,
                                            builder: (context) =>
                                                MediaPickDialog());
                                        if (pickedFile != null) {
                                          Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .addImage(
                                                  selectedImage: pickedFile);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 39.w,
                                      height: 39.h,
                                      child: Image.asset(
                                        'assets/images/addImg.png',
                                      ),
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .img2 !=
                                          null) {
                                        var pickedFile = await showDialog(
                                            context: context,
                                            builder: (context) =>
                                                MediaPickDialog());
                                        if (pickedFile != null) {
                                          Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .updateImage(
                                                  selectedImage: pickedFile,
                                                  index: 1);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 21.85.w,
                                      height: 24.h,
                                      child: Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img2 ==
                                              null
                                          ? Container()
                                          : Image.file(
                                              Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img2,
                                              fit: BoxFit.cover,
                                            ),
                                      color: Colors.grey[350],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .img3 !=
                                          null) {
                                        var pickedFile = await showDialog(
                                            context: context,
                                            builder: (context) =>
                                                MediaPickDialog());
                                        if (pickedFile != null) {
                                          Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .updateImage(
                                                  selectedImage: pickedFile,
                                                  index: 2);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 21.85.w,
                                      height: 24.h,
                                      child: Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img3 ==
                                              null
                                          ? Container()
                                          : Image.file(
                                              Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img3,
                                              fit: BoxFit.cover,
                                            ),
                                      color: Colors.grey[350],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .img4 !=
                                          null) {
                                        var pickedFile = await showDialog(
                                            context: context,
                                            builder: (context) =>
                                                MediaPickDialog());
                                        if (pickedFile != null) {
                                          Provider.of<AddOfferProvider>(context,
                                                  listen: false)
                                              .updateImage(
                                                  selectedImage: pickedFile,
                                                  index: 3);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 21.85.w,
                                      height: 24.h,
                                      child: Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img4 ==
                                              null
                                          ? Container()
                                          : Image.file(
                                              Provider.of<AddOfferProvider>(
                                                      context,
                                                      listen: true)
                                                  .img4,
                                              fit: BoxFit.cover,
                                            ),
                                      color: Colors.grey[350],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 48.w,
                                ),
                                Text(
                                  "Add Field",
                                  style: TextStyle(
                                      fontFamily: "Salsa-Regular",
                                      fontSize: ScreenUtil().setSp(12),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Container(
                              width: 186.w,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                    autoPlay: false,
                                    enlargeCenterPage: false,
                                    viewportFraction: 0.38,
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
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 54.w,
                                            height: 46.h,
                                            color: Colors.grey[350],
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Container(
                                            width: 54.w,
                                            height: 46.h,
                                            color: Colors.grey[350],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
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
                                      width: 4.0.w,
                                      height: 9.0.h,
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
                                          SvgPicture.asset(
                                            'assets/images/duration.svg',
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
                                                color: Colors.grey[350],
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
                                          SvgPicture.asset(
                                            'assets/images/budget.svg',
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
                                                color: Colors.grey[350],
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
                                          SvgPicture.asset(
                                            'assets/images/location.svg',
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
                                            fontFamily: "Shrikhand-Regular",
                                            fontWeight: FontWeight.w400)),
                                    SvgPicture.asset(
                                      "assets/images/send.svg",
                                      width: 15,
                                      height: 20,
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
