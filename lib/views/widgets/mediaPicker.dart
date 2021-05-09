import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/mediaPickerProvider.dart';
import 'package:yeeo/views/theme/appTheme.dart';

class MediaPickDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            height: 160,
            child: Material(
              color: Colors.white,
              animationDuration: Duration(milliseconds: 500),
              elevation: 0.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      var file = Provider.of<MediaPickerProvider>(context,
                              listen: false)
                          .pickerGallary(1);
                      Navigator.pop(context, file);
                    },
                    child: Padding(
                      padding: EdgeInsetsResponsive.only(
                          bottom: 0, left: 30, right: 30),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              child: Icon(
                                Icons.image,
                                size: 40,
                                color: appTheme().primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      var file = Provider.of<MediaPickerProvider>(context,
                              listen: false)
                          .pickerGallary(0);
                      Navigator.pop(context, file);
                    },
                    child: Padding(
                      padding: EdgeInsetsResponsive.only(
                          bottom: 0, left: 30, right: 30),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              child: Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: appTheme().primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
