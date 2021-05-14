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
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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
    ResponsiveWidgets.init(context,
        height: 725.0, width: 360.0, allowFontScaling: true);

    return ResponsiveWidgets.builder(
      height: 725.0,
      width: 360.0,
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
          height: 76.h,
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
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/bottomNavBackground.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () => onChange(0),
                child: BottomNavItem(
                  icon: 'addOffer',
                  title: 'mainMenu'.tr(),
                  isActive: currentIndex == 0,
                ),
              ),
              SizedBox(
                width: 60.w,
              ),
              InkWell(
                onTap: () => onChange(1),
                child: BottomNavItem(
                  icon: 'basket',
                  title: "myProducts".tr(),
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
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive
          ? Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/$icon.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          : Image.asset(
              'assets/images/$icon.png',
              width: 50.w,
              height: 50.h,
            ),
    );
  }
}
