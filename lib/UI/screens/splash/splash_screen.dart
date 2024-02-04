import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:project_iot/UI/screens/splash/splash_viewmodel.dart';
import 'package:project_iot/app/app.locator.dart';
import 'package:project_iot/app/app_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 4));
    controller.forward();
    final ThemeManager  _themeManager = getThemeManager(context);
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(
          // locator<NavigationService>()
      ),
      onViewModelReady: (model)=> model.changeScreen(),
      builder: (context,model,child) => Scaffold(
        body: Center(
          child: Animate(
            controller: controller,
          ).custom(
            duration: 2.seconds,
            begin: 6,
            end: 20,
            builder: (_, value, __) => Image.asset(
              _themeManager.isDarkMode?AppHelpers.imgLogo:AppHelpers.lightImgLogo,
              // width: 500,
              height: value*10,
            ),
          ).rotate(),
        ),
      ),
    );
  }
}
