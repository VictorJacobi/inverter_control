import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_iot/app/app_helper.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ApplianceCard extends StatelessWidget {
  final String? svgImage;
  final String? type;
  final String? value;
  final String? unit;
  final Color? color;
  const ApplianceCard({Key? key,this.color,required this.svgImage,required this.type,required this.value,required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeManager themeManager = getThemeManager(context);
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      // alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: themeManager.isDarkMode?AppHelpers.darkContainerColor:Colors.white,
        border: themeManager.isDarkMode?Border.all(
          color: AppHelpers.darkborderContainerColor,
        ):null,
        borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            opacity: 0.2,
            alignment: Alignment.topRight,
          filterQuality: FilterQuality.high,
          // colorFilter: const ColorFilter.mode(Colors.white,),
          image: AssetImage(
            themeManager.isDarkMode?AppHelpers.darkImgLogo:AppHelpers.lightImgLogo1,
          ),
      ),
      ),
      width: MediaQuery.sizeOf(context).width/2.8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: themeManager.isDarkMode?AppHelpers.darkSmallContainerColor:AppHelpers.lightContainerColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(svgImage??'',height: 24,width: 24,color: const Color(0xFF56D741),),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const  EdgeInsets.only(top: 16.0,bottom: 8),
                  child: Text(
                    '$type',
                    style: TextStyle(
                      color: themeManager.isDarkMode?AppHelpers.goldPrimaryColor:AppHelpers.lightTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                RichText(

                    text: TextSpan(
                        text: '$value',
                        style: TextStyle(
                          color: themeManager.isDarkMode?Colors.white:AppHelpers.lightTextColor4,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: ' $unit',
                            style: const TextStyle(
                              color: AppHelpers.blueDarkButtonColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ]
                    )),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
