import 'dart:developer';

import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project_iot/UI/screens/home/home_viewmodel.dart';
import 'package:project_iot/app/app.locator.dart';
import 'package:project_iot/app/app_helper.dart';
import 'package:project_iot/count.dart';
import 'package:project_iot/loading_widget.dart';
import 'package:project_iot/networks/data_base/readData.dart';
import 'package:project_iot/networks/data_base/write_data.dart';
import 'package:project_iot/networks/models/appliance_model.dart';
import 'package:project_iot/widets/appliance_card.dart';
import 'package:project_iot/widets/profile_pic_image.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

Color onColor = Colors.yellow;
Color offColor = Colors.greenAccent;
String bulbText = 'ON';
bool value = true;

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeManager themeManager = getThemeManager(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(locator<WriteData>(),locator<ReadData>(),),
      builder: (context,model,child) => StreamBuilder<DatabaseEvent>(
          stream: model.event,
          builder: (context, snapshot) {


            Map<dynamic,dynamic>? data = snapshot.data?.snapshot.value as Map<dynamic,dynamic>?;
            int? level = data?['battery']?['value'];
            bool? lightState = data?['lightState']?['switch'] as bool?;
            // log('${snapshot.data?.snapshot.value}');
            List<ApplianceModel> appliances = [];
            if(data!=null){
              for(var key in data.keys){
                // log('${data[key].runtimeType}');
                if(key!='lightState'&&key!='batteryLevel'&&key!='battery'){
                  appliances.add(ApplianceModel.fromJson(data[key]));
                }
              }
            }
            // log('$appliances');

            // if(snapshot.data==null){
            //   return const Scaffold(body: Center(
            //     child: CircularProgressIndicator(color: Colors.blue,),
            //   ));i
            // }
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: themeManager.isDarkMode?AppHelpers.darkPrimaryColor: Colors.white,
                  body: SafeArea(
                    top: true,
                    bottom: false,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      ProfilePicImageViewer(
                                        imageType: ImageType.asset,
                                        image: AppHelpers.logoJpg,
                                        height: 52,
                                        width: 52,
                                      ),
                                      Padding(
                                        padding:  const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Hello N-GESC!',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: AppHelpers.goldPrimaryColor,
                                              ),
                                            ),
                                            Text(
                                              'What are we doing today?',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: themeManager.isDarkMode?Colors.white:AppHelpers.blackTextColor1,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      const Expanded(child: SizedBox.shrink()),
                                      InkWell(
                                        onTap: () {
                                          themeManager
                                              .toggleDarkLightTheme();
                                        },
                                        // model.toggleTheme,
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: themeManager.isDarkMode?AppHelpers.blackTextColor1:Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Image.asset(themeManager.isDarkMode?AppHelpers.imgToggle:AppHelpers.imgLightToggle),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    decoration: BoxDecoration(
                                      color: themeManager.isDarkMode?AppHelpers.darkContainerColor:AppHelpers.lightContainerColor,
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(16),
                                          decoration:  BoxDecoration(
                                            color: themeManager.isDarkMode?AppHelpers.darkContainerColor:Colors.white,
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          height: MediaQuery.sizeOf(context).height/6,
                                          padding: const EdgeInsets.all(24),
                                          child: Row(
                                            children: [
                                              CircleProgressBar(
                                                foregroundColor: AppHelpers.blueDarkButtonColor,
                                                backgroundColor: Colors.black12,
                                                value: model.calculatePercentage(level),
                                                // value:  .75,
                                                strokeWidth: 10,
                                                child:  Center(
                                                  child: AnimationCount(
                                                    count: model.calculatePercentage(level),
                                                    // count: .75,
                                                    // ((18 * (level??0))/ (65535)),
                                                    unit: '%',
                                                    unitScaleFactor: 1.4,
                                                    duration: const Duration(milliseconds: 500),
                                                    style: const TextStyle(
                                                        color: AppHelpers.lightTextColor2
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width/6.7),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      'Battery voltage',
                                                      style: TextStyle(
                                                          color: AppHelpers.lightTextColor3,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    RichText(
                                                        text:  TextSpan(
                                                            text: model.calculateBatteryVoltage(level).toStringAsFixed(1)??'',
                                                            style: TextStyle(
                                                              color: themeManager.isDarkMode?Colors.white:AppHelpers.lightTextColor4,
                                                              fontSize: 28,
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                            children: const [
                                                              TextSpan(
                                                                text: ' Volts',
                                                                style: TextStyle(
                                                                  color: AppHelpers.blueDarkButtonColor,
                                                                  fontSize: 17,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              )
                                                            ]
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width,
                                          child: GridView.builder(
                                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                                            shrinkWrap: true,
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2, // Number of columns
                                              crossAxisSpacing: 16.0, // Spacing between columns
                                              mainAxisSpacing: 16.0, // Spacing between rows
                                            ),
                                            itemCount: appliances.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              // Replace this with the widget you want to display for each item
                                              return  ApplianceCard(
                                                type: appliances[index].type,
                                                value: appliances[index].value==null?'':appliances[index].value!<1?'0.0':model.calculateAcValueFromAdc(appliances[index]).toStringAsFixed(1)??'',
                                                unit: appliances[index].unit,
                                                svgImage: AppHelpers().svgPath(appliances[index].image??''),
                                                // svgImage: AppHelpers.svg_logo_icon,
                                              );
                                            },
                                            // alignment: WrapAlignment.spaceEvenly,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          height: MediaQuery.sizeOf(context).height/4.9,
                          width: double.infinity,
                          decoration:  ShapeDecoration(
                            color: themeManager.isDarkMode?Theme.of(context).inputDecorationTheme.fillColor:AppHelpers.lightContainerColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
                            ),
                          ),
                          alignment: Alignment.center,
                          child:   Builder(
                            builder: (context) {
                              final GlobalKey<SlideActionState> _key = GlobalKey();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SlideAction(
                                  // alignment: Alignment,
                                  outerColor: themeManager.isDarkMode?AppHelpers.lightTextColor:AppHelpers.lightButtonColor,
                                  innerColor: themeManager.isDarkMode?AppHelpers.lightButtonColor:AppHelpers.lightTextColor,
                                  key: _key,
                                  onSubmit: () {
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                          () => _key.currentState?.reset(),

                                    );
                                    model.toggleInverter(lightState);
                                    return null;
                                  },
                                  child: Text(
                                    lightState==true?'Swipe to turn off your inverter':'Swipe to turn on your inverter',
                                    style: TextStyle(
                                      color:  themeManager.isDarkMode?Colors.white:AppHelpers.lightTextColor5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                ),
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                LoadingWidget(isBusy: snapshot.data==null,)
              ],
            );
          }
      ),
    );
  }
}

