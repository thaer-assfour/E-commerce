import 'package:e_commerce/main.dart';
import 'package:e_commerce/pages/login/LoginPage.dart';
import 'package:e_commerce/pages/splash/CustomPaint.dart';
import 'package:e_commerce/pages/splash/SplashListText.dart';
import 'package:e_commerce/pages/splash/SplashPageDetails.dart';
import 'file:///D:/Android/FlutterProjects/E-commerce/lib/services/language/AppLocal.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'file:///D:/Android/FlutterProjects/E-commerce/lib/services/language/LanguageService.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = (Localizations.localeOf(context).languageCode);
    List splashList = splashListTextEN;
    if (languageCode == "ar") splashList = splashListTextAR;

    return SafeArea(
      child: Stack(
        children: [
          Positioned(
              child: Container(
            color: Colors.white,
          )),
          Positioned(child: SplashTopPainter()),
          Positioned(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actionsIconTheme: IconThemeData(color: Color(0xff6990B9)),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.language,
                        color: Colors.white /* Color(0xff6990B9)*/,
                      ),
                      onPressed: () {
                        setState(() {
                          changeDefaultLang(context);
                        });
                      },
                    ),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(
                      "${getLang(context, "splashTitle")}",
                      style: TextStyle(
                          color: Color(0xff6990B9),
                          fontSize: 36,
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
                        margin: EdgeInsets.only(top: 8, bottom: 24),
                        padding: EdgeInsets.all(6),
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
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.4),
                          ),
                          onTap: () async {
                             mySharedPreferences.setBool('runBefore', true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
