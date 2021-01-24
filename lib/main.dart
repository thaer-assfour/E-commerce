import 'package:e_commerce/pages/login/LoginPage.dart';
import 'package:e_commerce/pages/splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Android/FlutterProjects/E-commerce/lib/services/language/AppLocal.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences mySharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mySharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();

  Widget _startUpScreen;
  bool isRunBefore =  mySharedPreferences.getBool('runBefore');
  if (isRunBefore == null || isRunBefore == false)
    _startUpScreen = SplashScreen();
  else
    _startUpScreen = LoginScreen();


  runApp(MyStore(_startUpScreen));
}

class MyStore extends StatefulWidget {
  final Widget startupScreen;

 MyStore(this.startupScreen);

  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); // #force to set Orientations to portrait only.

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans',primaryColor: Color(0xff6990B9),),
      home: widget.startupScreen,
      localizationsDelegates: [
        AppLocale.delegate ,
        GlobalMaterialLocalizations.delegate ,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales:[
        Locale("en"  , "") ,
        Locale("ar"  , "") ,
      ] ,
      locale: Locale("${mySharedPreferences.getString("Lang")}" , ""), //set default lang for app
      localeResolutionCallback:( currentLang , supportLang ){
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              mySharedPreferences.setString("Lang", currentLang.languageCode);
              return currentLang ;
            }
          }
        }
        return supportLang.first ;
      } ,

    );
  }
}
