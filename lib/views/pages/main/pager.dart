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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/pagerProvider.dart';
import 'package:yeeo/views/pages/main/basket.dart';
import 'addOffer.dart';

class Pager extends StatefulWidget {
  @override
  _PagerState createState() => _PagerState();
}

class _PagerState extends State<Pager> with SingleTickerProviderStateMixin {
  List<Widget> pages = [
    AddOffer(),
    Basket(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<PagerProvider>(context, listen: false).tabController =
        TabController(
            vsync: this,
            length: pages.length,
            initialIndex: Provider.of<PagerProvider>(context, listen: false)
                .bottomSelectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    ResponsiveWidgets.init(context,
        height: 896.0, width: 414.0, allowFontScaling: true);

    return ResponsiveWidgets.builder(
      height: 896.0,
      width: 414.0,
      allowFontScaling: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller:
              Provider.of<PagerProvider>(context, listen: false).tabController,
          children: pages,
        ),
        bottomNavigationBar: SizedBox(
          height: 60.h,
          width: width,
          child: AnimatedBottomNav(
              currentIndex: Provider.of<PagerProvider>(context, listen: true)
                  .bottomSelectedIndex,
              onChange: (index) {
                Provider.of<PagerProvider>(context, listen: false).onTap(index);
              }),
        ),
      ),
    );
  }
}

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;

  const AnimatedBottomNav({Key key, this.currentIndex, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Container(
            color: Color(0xffF2F2F2),
            height: 1,
            width: width,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 30.h,
                width: width,
                child: SvgPicture.asset('assets/images/bottomNavBackground.svg',
                    fit: BoxFit.fill, height: 30.h, width: width),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () => onChange(0),
                child: BottomNavItem(
                  icon: 'addOffer',
                  title: 'addOffer',
                  isActive: currentIndex == 0,
                ),
              ),
              SizedBox(
                width: 174.w,
              ),
              InkWell(
                onTap: () => onChange(1),
                child: BottomNavItem(
                  icon: 'basket',
                  title: "basket",
                  isActive: currentIndex == 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final String icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;

  const BottomNavItem(
      {Key key,
      this.isActive = false,
      this.icon,
      this.activeColor,
      this.inactiveColor,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 50),
      reverseDuration: Duration(milliseconds: 20),
      child: icon == "basket"
          ? Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/$icon.svg',
                    width: 29.w,
                    height: 32.h,
                  ),
                ],
              ),
            )
          : Image.asset(
              'assets/images/$icon.png',
              width: 36.w,
              height: 32.h,
            ),
    );
  }
}
