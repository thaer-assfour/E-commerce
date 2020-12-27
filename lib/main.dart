import 'package:e_commerce/pages/splash/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyStore());
}

class MyStore extends StatefulWidget {
  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
