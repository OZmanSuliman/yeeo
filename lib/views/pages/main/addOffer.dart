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
import 'package:yeeo/views/widgets/CustomPopUpMenuButton.dart';
import 'package:yeeo/views/widgets/languages.dart';
import 'package:yeeo/views/widgets/mediaPicker.dart';
import 'dart:math' as math;

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
    Provider.of<AddOfferProvider>(context, listen: false).setUpCategoris();
  }

  @override
  void dispose() {
    // Provider.of<AddOfferProvider>(context, listen: false)
    //     .pageController
    //     .dispose();
    super.dispose();
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
                      yeeoWidget(),
                      SizedBox(
                        height: 5.h,
                      ),
                      Image.asset('assets/images/addOfferBanner.png'),
                      titleWidget(),
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
                            descriptionWidget(context, provider),
                            mediaPickersWidget(context),
                            categoriesWidget(provider, providerFunc),
                            SizedBox(
                              height: 4.h,
                            ),
                            categoriesIndicatorsWidget(provider),
                            Column(
                              children: [
                                durationWidget(context, provider),
                                budgetWidget(context, provider),
                                locationWidget(context, provider, providerFunc),
                                SizedBox(
                                  height: 24.h,
                                ),
                              ],
                            ),
                            sendBtnWidget(context, provider),
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

  Align yeeoWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsetsResponsive.only(left: 17.0),
        child: Text("Yeeo",
            style: TextStyle(
                fontFamily: "Salsa-Regular", fontSize: ScreenUtil().setSp(30))),
      ),
    );
  }

  Row titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 50.w,
            ),
            Padding(
              padding: EdgeInsetsResponsive.only(top: 38.0),
              child: Container(
                padding: EdgeInsetsResponsive.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "job describtion".tr(),
                  style: TextStyle(
                      fontFamily: "Tharlon-Regular",
                      fontSize: ScreenUtil().setSp(17),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 50.w,
        ),
        Padding(
          padding: EdgeInsetsResponsive.only(bottom: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LanguageWidget(),
              SizedBox(
                width: 50.w,
              )
            ],
          ),
        ),
      ],
    );
  }

  Container descriptionWidget(BuildContext context, AddOfferProvider provider) {
    return Container(
      margin: EdgeInsetsResponsive.fromLTRB(33, 28, 37, 15),
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
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 205.h,
      child: TextFormField(
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        controller: provider.noteController,
        minLines: 25,
        validator: Validator.validateEmptiness,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            hintText: "description".tr(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            )),
        maxLines: null,
      ),
    );
  }

  Column mediaPickersWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 48.w,
            ),
            Text(
              "Add image".tr(),
              style: TextStyle(
                  fontFamily: "Salsa-Regular",
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Container(
          margin: EdgeInsetsResponsive.fromLTRB(38, 2, 45, 17),
          height: 44.h,
          decoration: BoxDecoration(
              border: Border.all(color: appTheme().primaryColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (Provider.of<AddOfferProvider>(context, listen: false)
                          .img4 ==
                      null) {
                    var pickedFile = await showDialog(
                        context: context,
                        builder: (context) => MediaPickDialog());
                    if (pickedFile != null) {
                      Provider.of<AddOfferProvider>(context, listen: false)
                          .addImage(selectedImage: pickedFile);
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
                  if (Provider.of<AddOfferProvider>(context, listen: false)
                          .img2 !=
                      null) {
                    var pickedFile = await showDialog(
                        context: context,
                        builder: (context) => MediaPickDialog());
                    if (pickedFile != null) {
                      Provider.of<AddOfferProvider>(context, listen: false)
                          .updateImage(selectedImage: pickedFile, index: 1);
                    }
                  }
                },
                child: Container(
                  width: 21.85.w,
                  height: 24.h,
                  child: Provider.of<AddOfferProvider>(context, listen: true)
                              .img2 ==
                          null
                      ? Container()
                      : Image.file(
                          Provider.of<AddOfferProvider>(context, listen: true)
                              .img2,
                          fit: BoxFit.cover,
                        ),
                  color: Color(0xffC4C4C4),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () async {
                  if (Provider.of<AddOfferProvider>(context, listen: false)
                          .img3 !=
                      null) {
                    var pickedFile = await showDialog(
                        context: context,
                        builder: (context) => MediaPickDialog());
                    if (pickedFile != null) {
                      Provider.of<AddOfferProvider>(context, listen: false)
                          .updateImage(selectedImage: pickedFile, index: 2);
                    }
                  }
                },
                child: Container(
                  width: 21.85.w,
                  height: 24.h,
                  child: Provider.of<AddOfferProvider>(context, listen: true)
                              .img3 ==
                          null
                      ? Container()
                      : Image.file(
                          Provider.of<AddOfferProvider>(context, listen: true)
                              .img3,
                          fit: BoxFit.cover,
                        ),
                  color: Color(0xffC4C4C4),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () async {
                  if (Provider.of<AddOfferProvider>(context, listen: false)
                          .img4 !=
                      null) {
                    var pickedFile = await showDialog(
                        context: context,
                        builder: (context) => MediaPickDialog());
                    if (pickedFile != null) {
                      Provider.of<AddOfferProvider>(context, listen: false)
                          .updateImage(selectedImage: pickedFile, index: 3);
                    }
                  }
                },
                child: Container(
                  width: 21.85.w,
                  height: 24.h,
                  child: Provider.of<AddOfferProvider>(context, listen: true)
                              .img4 ==
                          null
                      ? Container()
                      : Image.file(
                          Provider.of<AddOfferProvider>(context, listen: true)
                              .img4,
                          fit: BoxFit.cover,
                        ),
                  color: Color(0xffC4C4C4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector sendBtnWidget(BuildContext context, provider) {
    return GestureDetector(
      onTap: () {
        if (Provider.of<AddOfferProvider>(context, listen: false)
            .homeFormKey
            .currentState
            .validate()) {
          Provider.of<AddOfferProvider>(context, listen: false).send(context);
        }
      },
      child: Container(
        margin: context.locale == Locale("ar")
            ? EdgeInsetsResponsive.fromLTRB(30, 10, 30, 28)
            : EdgeInsetsResponsive.fromLTRB(30, 10, 30, 28),
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            border: Border.all(color: appTheme().primaryColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          mainAxisAlignment: context.locale == Locale("ar")
              ? MainAxisAlignment.end
              : MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: context.locale == Locale("ar") ? 15.w : 5,
            ),
            Text("Send".tr(),
                style: TextStyle(
                    fontFamily: "Shrikhand-Regular",
                    fontWeight: context.locale == Locale("ar")
                        ? FontWeight.bold
                        : FontWeight.w400)),
            SizedBox(
              width: context.locale == Locale("ar") ? 2.w : 0,
            ),
            Transform(
              alignment: Alignment.center,
              transform: (context.locale == Locale("ar"))
                  ? Matrix4.rotationY(math.pi)
                  : Matrix4.rotationY(0),
              child: SvgPicture.asset(
                "assets/images/send.svg",
                width: 15,
                height: 20,
              ),
            ),
            SizedBox(
              width: context.locale == Locale("ar") ? 15.w : 5,
            )
          ],
        ),
      ),
    );
  }

  Row locationWidget(BuildContext context, AddOfferProvider provider,
      AddOfferProvider providerFunc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w,
        ),
        Container(
          width: 90.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    fontWeight: context.locale == Locale("ar")
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
          width: 130.w,
          margin: EdgeInsetsResponsive.only(left: 10, top: 21),
          child: CustomPopupMenuButton<String>(
              child: AbsorbPointer(
                absorbing: true,
                child: TextFormField(
                  enabled: true,
                  expands: false,
                  textAlign: TextAlign.start,
                  controller: provider.locationController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: appTheme().primaryColor),
                      ),
                      errorStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(10),
                      ),
                      hintText: "select city".tr(),
                      hintStyle: TextStyle(
                          color: Color(0xffC4C4C4),
                          fontFamily: "Salsa-Regular")),
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      fontFamily: "Salsa-Regular"),
                  validator: Validator.validateEmptiness,
                ),
              ),
              offset: Offset(20, 11),
              onSelected: (city) {
                providerFunc.changeCity(city);
              },
              height: 100,
              itemBuilder: (context) => [
                    "Abu Dhabi",
                    "Ras Al Khaimah",
                    "Dubai",
                    "Sharjah",
                    "Ajman",
                    "Umm Al-Quwain",
                    "Fujairah",
                  ].map((String city) {
                    return PopupMenuItem(
                      height: 30,
                      value: city,
                      child: Text(city),
                    );
                  }).toList()),
        ),
      ],
    );
  }

  Row budgetWidget(BuildContext context, AddOfferProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w,
        ),
        Container(
          width: 90.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      fontWeight: context.locale == Locale("ar")
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
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(10),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: appTheme().primaryColor),
                ),
                hintText: "Budget".tr(),
                hintStyle: TextStyle(
                    color: Color(0xffC4C4C4), fontFamily: "Salsa-Regular")),
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12), fontFamily: "Salsa-Regular"),
            validator: Validator.validateEmptiness,
          ),
        ),
      ],
    );
  }

  Row durationWidget(BuildContext context, AddOfferProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w,
        ),
        Container(
          width: 90.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      fontWeight: context.locale == Locale("ar")
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
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(10),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: appTheme().primaryColor),
                ),
                hintText: "Duration".tr(),
                hintStyle: TextStyle(
                    color: Color(0xffC4C4C4), fontFamily: "Salsa-Regular")),
            validator: Validator.validateEmptiness,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12), fontFamily: "Salsa-Regular"),
          ),
        ),
      ],
    );
  }

  Column categoriesWidget(provider, providerFunc) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 48.w,
            ),
            Text(
              "Add Field".tr(),
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
          width: 196.w,
          height: 128.h,
          child: PageView.builder(
              controller: provider.pageController,
              itemCount: provider.pageCount,
              onPageChanged: (index) {
                providerFunc.onCateoriesPageChange(index);
              },
              itemBuilder: (_, pageIndex) {
                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  childAspectRatio: 54 / 46,
                  shrinkWrap: true,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 6,
                  crossAxisCount: 3,
                  children: List.generate(
                      (provider.pageCount - 1) != pageIndex
                          ? provider.perPageItem
                          : provider.lastPageItemLength, (index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 54.w,
                        height: 46.h,
                        color: Color(0xffC4C4C4),
                        alignment: Alignment.center,
                        child: Text(
                          provider.categories[
                              index + (pageIndex * provider.perPageItem)],
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    );
                  }),
                );
              }),
        ),
      ],
    );
  }

  SizedBox categoriesIndicatorsWidget(provider) {
    return SizedBox(
      height: 15.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.pageCount,
        itemBuilder: (_, index) {
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
                  color: provider.selectedIndex == index
                      ? appTheme().primaryColor
                      : appTheme().primaryColorLight,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
