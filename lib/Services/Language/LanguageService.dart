
import 'package:e_commerce/pages/login/LoginPage.dart';
import 'package:e_commerce/pages/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/main.dart';


void changeDefaultLang (BuildContext context){
  if (Localizations.localeOf(context).languageCode == "ar")
    mySharedPreferences.setString("Lang", "en");
  else
    mySharedPreferences.setString("Lang", "ar");

  bool isRunBefore = mySharedPreferences.getBool('runBefore');
  Widget _startUpScreen;
  if (isRunBefore == null || isRunBefore == false)
    _startUpScreen = SplashScreen();
  else
    _startUpScreen = LoginScreen();


  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyStore(_startUpScreen)));
}