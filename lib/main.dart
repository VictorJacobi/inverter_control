import 'package:flutter/material.dart';
import 'package:project_iot/app/app.locator.dart';
import 'package:project_iot/app/app_themes.dart';
import 'package:project_iot/UI/screens/login/login_screen.dart';
import 'package:project_iot/UI/screens/home/home_screen.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'firebase_options.dart';

import'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  await ThemeManager.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      darkTheme: AppThemes.darkTheme,
      lightTheme: AppThemes.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const LoginView(),
        );
      }
    );
  }
}
