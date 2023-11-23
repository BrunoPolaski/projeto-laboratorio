import 'package:app_facul/app/utils/device_dimensions_utils.dart';

class CustomHeight{
    static double custom(double height){
      return _calculateSpace(height);
    }

    static double baseHeight = 920.0;
      
    static double _calculateSpace(double baseSize){
      double heightRatio = DeviceDimensions.screenHeight / baseHeight;
      double adjustedHeight = baseSize * heightRatio;

      return adjustedHeight;
    }

}

class CustomWidth{
    static double custom(double width){
      return _calculateSpace(width);
    }

    static double baseWidth = 420.0;
      
    static double _calculateSpace(double baseSize){
      double widthRatio = DeviceDimensions.screenWidth / baseWidth;
      double adjustedWidth = baseSize * widthRatio;

      return adjustedWidth;
    }

}
