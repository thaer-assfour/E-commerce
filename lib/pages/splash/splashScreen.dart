import 'package:e_commerce/pages/splash/splashListText.dart';
import 'package:e_commerce/pages/splash/splashPageDetails.dart';
import 'package:e_commerce/services/appLocal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              // height: MediaQuery.of(context).size.height * 0.65,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: splashList.length,
                  itemBuilder: (context, index) {
                    return SplashPageDetails(
                        splashList[index]); //welcome widget
                  }),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: splashList.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.orange[300],
                  dotColor: Color(0xff6990B9)),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xff6990B9).withOpacity(0.8),
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(24)),
                child: InkWell(
                  child: Text(
                    "${getLang(context, "GetStartedSplash")}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,letterSpacing: 1.4),
                  ),
                  onTap: () {},
                ))
          ],
        ));
  }
}
