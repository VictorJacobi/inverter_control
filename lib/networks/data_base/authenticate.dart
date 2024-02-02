
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_iot/networks/exceptions/unauthorized_handler.dart';

class Authentication {
  Future<UserCredential?> login(String email, String password) async{
     UserCredential? credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
         .catchError((error){
           AppExceptionHandlers().handleException(error);
     });
     return credential;
  }

}