import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // add var to get list from splashTextList arabic or english

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10,bottom: MediaQuery.of(context).size.height / 15),
              child: Text(
            "My Store Online",
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 30,
                fontStyle: FontStyle.italic),
          )),

        ],
      ),
    ));
  }
}
