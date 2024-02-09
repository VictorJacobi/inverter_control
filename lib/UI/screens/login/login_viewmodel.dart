import 'package:flutter/material.dart';
import 'package:project_iot/networks/data_base/authenticate.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel(this._auth,);
  final Authentication _auth;
  // final ThemeService _theme;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  Future<bool> login() async {
    final value = await runBusyFuture(_auth.login(email.text.trim(), password.text.trim()),throwException: true);
    password.clear();
    return value!=null;
  }
  // void toggleTheme(){
  //   _theme.toggleDarkLightTheme();
  // }

}