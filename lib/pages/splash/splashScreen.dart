import 'package:e_commerce/pages/splash/splashListText.dart';
import 'package:e_commerce/services/appLocal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    String languageCode =
        (Localizations.localeOf(context).toString()).substring(0, 2);
    List splashList = splashListTextEN;
    if (languageCode == "ar") splashList = splashListTextAR;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10),
                child: Text(
                  "${getLang(context, "splashTitle")}",
                  style: TextStyle(
                      color: Color(0xff6990B9),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: splashList.length,
                  itemBuilder: (context, index) {
                    return SplashPageDetails(
                        splashList[index]); //welcome widget
                  }),
            ),
          ],
        ));
  }
}

class SplashPageDetails extends StatelessWidget {
  final list;

  SplashPageDetails(this.list);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          list['image'],
          width: MediaQuery.of(context).size.width / 1.2,
        ),
        Text(
          list['title'],
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.orange, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            list['description'],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w200),
          ),
        ),
      ],
    );
  }
}
