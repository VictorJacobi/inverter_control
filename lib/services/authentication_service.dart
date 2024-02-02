import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_iot/networks/data_base/authenticate.dart';
import 'package:project_iot/networks/exceptions/unauthorized_handler.dart';

class AuthenticationService{
  AuthenticationService(this._auth);
  final Authentication _auth;
  Future<UserCredential?> login(String email, String password) async{
    try{
     UserCredential? credential = await _auth.login(email, password);

    }catch(e){
      log('$e');
      // final exception = await AppExceptionHandlers().handleException(e);
      // if(exception!=null){
      //   _flushBarService.showFlushError(title: exception?.message??'');
      // }

   rethrow;
    }
    return null;

  }
}