
import 'package:flutter/material.dart';
import 'package:e_commerce/main.dart';

void changeDefaultLang (BuildContext context){
  if (Localizations.localeOf(context).languageCode == "ar")
    mySharedPreferences.setString("Lang", "en");
  else
    mySharedPreferences.setString("Lang", "ar");
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyStore()));



}