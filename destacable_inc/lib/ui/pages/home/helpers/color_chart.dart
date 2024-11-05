import 'dart:ui';

class ColorChart {

  static  Color getColorForValue(double value, double maxValue) {
    double ratio = (value / maxValue);
    int red = (255 * (ratio)).toInt(); 
    int blue = (255 * (1-ratio)).toInt();
    return Color.fromRGBO(red, 0, blue, 1);
  }
}