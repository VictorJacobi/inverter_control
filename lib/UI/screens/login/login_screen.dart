import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:project_iot/UI/screens/login/login_viewmodel.dart';
import 'package:project_iot/app/app.locator.dart';
import 'package:project_iot/app/app_helper.dart';
import 'package:project_iot/custom_widgets/custom_textfield.dart';
import 'package:project_iot/loading_widget.dart';
import 'package:project_iot/UI/screens/home/home_screen.dart';
import 'package:project_iot/networks/data_base/authenticate.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_themes/stacked_themes.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 4));
    controller.forward();
    final ThemeManager _themeManager = getThemeManager(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(locator<Authentication>(),locator<ThemeService>(),),
      builder: (context,model,child) => WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: Stack(
          children: [
            Scaffold(
              // resizeToAvoidBottomInset: true,
              backgroundColor: _themeManager.isDarkMode?AppHelpers.darkBackgroundColor:AppHelpers.lightBackgroundColor,
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Expanded(child: SizedBox.shrink()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                InkWell(
                                  onTap: (){getThemeManager(context)
                                      .toggleDarkLightTheme();},
                                  // model.toggleTheme,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: _themeManager.isDarkMode?AppHelpers.darkSecondaryColor:Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                      child: Image.asset(AppHelpers.toggle),
                                  ),
                                ),
                              ],
                            ),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 36.0),
                               child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Animate(
                                     controller: controller,
                                   ).custom(
                                     duration: 10.seconds,
                                     begin: 3,
                                     end: 10,
                                     builder: (_, value, __) => Image.asset(
                                       AppHelpers.logo,
                                       height: value*10,
                                     ),
                                   ).move(),
                                 ],
                               ),
                             ),
                             Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                  'Email Address',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                ),
                              ),
                            ),
                            CustomTextInputField(
                              controller: model.email,
                              fieldlabel: 'Enter your email address',
                              errorText: '',
                              filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 30,top: 20,bottom: 20,right: 10),
                                child: SvgPicture.asset(AppHelpers.message_icon,fit: BoxFit.cover,width: 16,height: 13,color: _themeManager.isDarkMode?AppHelpers.primaryColor:AppHelpers.darkButtonColor,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 12),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                ),
                              ),
                            ),
                            CustomTextInputField(
                              controller: model.password,
                              fieldlabel: 'Enter your password',
                              errorText: '',

                              filled: true,
                              ispassword: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 10),
                                child: SvgPicture.asset(AppHelpers.lock_icon,fit: BoxFit.cover,color: _themeManager.isDarkMode?AppHelpers.primaryColor:AppHelpers.darkButtonColor,),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height/4,
                    width: double.infinity,
                    decoration:  ShapeDecoration(
                      color: _themeManager.isDarkMode?Theme.of(context).inputDecorationTheme.fillColor:AppHelpers.lightSecondaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
                        ),
                    ),
                    alignment: Alignment.center,
                    child:  MaterialButton(
                      minWidth: MediaQuery.sizeOf(context).width-32,
                      height: 70,
                      onPressed: () async{
                        await model.login().then((value) {
                          if(value){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomeScreen()));
                          }

                        });
                      }, color: getThemeManager(context).isDarkMode?AppHelpers.darkButtonColor:AppHelpers.darkPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(53)
                      ),
                      child:   Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child:  Text('Sign in',style: _themeManager.isDarkMode?Theme.of(context).textTheme.bodyMedium:Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white
                        ),),
                      ),),
                  ),
                ],
              ),
            ),
            LoadingWidget(isBusy: model.isBusy,)
          ],
        ),
      )
    );
  }
}
