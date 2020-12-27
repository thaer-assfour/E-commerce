import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
                 child: Column(
                     children: [
                       Text("My Store Online",style: TextStyle(color: Colors.lightBlue,fontSize: 30,fontStyle: FontStyle.italic),),
                               ],
      ),
    ));
  }
}
