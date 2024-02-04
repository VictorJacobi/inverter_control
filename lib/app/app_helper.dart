import 'dart:ui';


class AppHelpers {
  static const darkPrimaryColor = Color(0xFF00102E);
  static const darkBackgroundColor = Color(0xFF00102E);
  static const goldPrimaryColor = Color(0xFFF6CD70);
  static const lightPrimaryColor = Color(0xFFFDFDFE);
  static const borderColor = Color(0xFFE8E8E8);
  static const lightBackgroundColor = Color(0xFFFDFDFE);
  static const blackTextColor1 = Color(0xFF101C35);
  static const lightContainerColor = Color(0xFFEAEFFA);
  static const darkContainerColor = Color(0xFF101C35);
  static const darkSmallContainerColor = Color(0xFF1B2435);
  static const darkborderContainerColor = Color(0xFF143040);
  static const lightFillColor = Color(0xFFF6F6F6);
  static const darkFillColor = Color(0xFF0E1A32);
  static const grey400 = Color(0xFF98A2B3);
  static const darkTextColor = Color(0xFFFFFFFF);
  static const lightTextColor = Color(0xFF00102E);
  static const lightTextColor2 = Color(0xFF97ABA4);
  static const lightTextColor3 = Color(0xFFAFAFAF);
  static const lightTextColor4 = Color(0xFF192535);
  static const lightTextColor5 = Color(0xFF4B4B4B);
  static const grey500 = Color(0xFF667185);
  static const blueDarkButtonColor = Color(0xFF07C4FB);
  // static const lightButtonColor = Color(0xFF07C4FB);
  static const lightButtonColor = Color(0xFFD9DBDE);




  static const String _baseSvg = "assets/svgs/";
  static const String _basePng = "assets/pngs/";
  String Function(String name) get svgPath => _getSvgPath;
  static String _getSvgPath(String pathName) {
    pathName = "$pathName.svg";
    return _baseSvg + pathName;
  }

  static String _getImagePath(String pathName) {
    pathName = "$pathName.png";
    return _basePng + pathName;
  }
  static String imgLogo = _getImagePath('logo');
  static String lightImgLogo = _getImagePath('light_logo');
  static String lightImgLogo1 = _getImagePath('light_logo1');
  static String lightImgLogo2 = _getImagePath('light_logo2');
  static String darkImgLogo = _getImagePath('dark_logo');
  static String imgToggle = _getImagePath('toggle');
  static String imgLightToggle = _getImagePath('light_toggle');
  static String imgAvatar = _getImagePath('Avatar');
  static String svg_logo_icon = _getSvgPath('logo_icon');
  static String svg_temp = _getSvgPath('temp');
  static String svg_temperature = _getSvgPath('temperature');
  static String svg_temperature_colored = _getSvgPath('temperature_colored');
  static String svg_lock_icon = _getSvgPath('lock_icon');
  static String svg_visibility_icon = _getSvgPath('visibility_icon');
  static String svg_message_icon = _getSvgPath('message_icon');

  

}
