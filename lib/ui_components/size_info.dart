import 'package:flutter/cupertino.dart';

class SizeInfo {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth, screenHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
