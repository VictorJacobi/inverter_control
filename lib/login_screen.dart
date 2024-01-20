import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/loading_widget.dart';
import 'package:project_iot/main_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = '';
  String password = '';
  bool isBusy = false;
  Future<UserCredential?> _login(String email, String password) async{
    try{
      isBusy = true;
      setState(() {

      });
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      isBusy = false;
      setState(() {

      });
      return credential;
    }catch(e){
      log(e.toString());

      // return null;
      // rethrow;
    }
    isBusy = false;
    setState(() {

    });
    return null;
     }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue,
              title: const Text('Login',style: TextStyle(
                // color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    TextField(
                      onChanged: (value){
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 48.0),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () async{
                          await _login(email.trim(), password.trim()).then((value) {
                            if(value!=null){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomeScreen()));
                            }

                          });
                      },color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      child:  const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child:  Text('Login'),
                      ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          LoadingWidget(isBusy: isBusy,)
        ],
      ),
    );
  }
}
