import 'dart:ui';


class AppHelpers {
  static const darkPrimaryColor = Color(0xFF00102E);
  static const darkBackgroundColor = Color(0xFF00102E);
  static const primaryColor = Color(0xFFF6CD70);
  static const lightPrimaryColor = Color(0xFFFDFDFE);
  static const borderColor = Color(0xFFE8E8E8);
  static const lightBackgroundColor = Color(0xFFFDFDFE);
  static const darkSecondaryColor = Color(0xFF101C35);
  static const lightSecondaryColor = Color(0xFFEAEFFA);
  static const lightFillColor = Color(0xFFF6F6F6);
  static const darkFillColor = Color(0xFF0E1A32);
  static const grey400 = Color(0xFF98A2B3);
  static const darkTextColor = Color(0xFFFFFFFF);
  static const lightTextColor = Color(0xFF00102E);
  static const grey500 = Color(0xFF667185);
  static const darkButtonColor = Color(0xFF07C4FB);
  // static const lightButtonColor = Color(0xFF07C4FB);




  static const String _baseSvg = "assets/svgs/";
  static const String _basePng = "assets/pngs/";

  static String _getSvgPath(String pathName) {
    pathName = "$pathName.svg";
    return _baseSvg + pathName;
  }

  static String _getImagePath(String pathName) {
    pathName = "$pathName.png";
    return _basePng + pathName;
  }
  static String logo = _getImagePath('logo');
  static String toggle = _getImagePath('toggle');
  static String logo_icon = _getSvgPath('logo_icon');
  static String temp = _getSvgPath('temp');
  static String temperature = _getSvgPath('temperature');
  static String temperature_colored = _getSvgPath('temperature_colored');
  static String lock_icon = _getSvgPath('lock_icon');
  static String visibility_icon = _getSvgPath('visibility_icon');
  static String message_icon = _getSvgPath('message_icon');

  

}
