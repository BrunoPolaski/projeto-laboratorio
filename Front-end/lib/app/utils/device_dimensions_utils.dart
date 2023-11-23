import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeviceDimensions {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double screenDensity = 0.0;

  static void init(BuildContext context) {
    if (kDebugMode) {
      print('width${MediaQuery.of(context).size.width}');
      print('height${MediaQuery.of(context).size.height}');
      print('devicePixelRatio${MediaQuery.of(context).devicePixelRatio}');
    }
    DeviceDimensions.screenWidth = MediaQuery.of(context).size.width;
    DeviceDimensions.screenHeight = MediaQuery.of(context).size.height;
    DeviceDimensions.screenDensity = MediaQuery.of(context).devicePixelRatio;
  }
}