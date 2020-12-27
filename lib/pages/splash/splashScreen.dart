import 'package:e_commerce/pages/splash/splashListText.dart';
import 'package:e_commerce/services/appLocal.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // add var to get list from splashTextList arabic or english
  @override
  Widget build(BuildContext context) {
    String languageCode =
        (Localizations.localeOf(context).toString()).substring(0, 2);
    List splashList = splashListTextEN;
    if (languageCode == "ar") splashList = splashListTextAR;


    return Scaffold(
        body: SafeArea(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 10,
                  bottom: MediaQuery.of(context).size.height / 15),
              child: Text(
                "${getLang(context, "splashTitle")}",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 30),
              )),
        ],
      ),
    ));
  }
}
