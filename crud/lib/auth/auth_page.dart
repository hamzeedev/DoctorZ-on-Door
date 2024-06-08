import 'package:crud/pages/individulaRegister.dart';
import 'package:crud/pages/login_page.dart';
import 'package:crud/pages/individual_register_page.dart';
import 'package:flutter/material.dart';

import '../pages/rgister_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;
  bool showRegisterPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(showRegisterPage: toggleScreens, showPatientRegisterPage: toggleScreens);
      
    }
    else if (showRegisterPage) {
      return RegisterPage(showLoginPage: toggleScreens,);
      
    } else{
      return  IndividualRegister();
      
    }

  }
  
}