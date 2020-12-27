import 'package:e_commerce/pages/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/services/appLocal.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: SplashScreen(),
     /* localizationsDelegates: [
        AppLocale.delegate ,
        GlobalMaterialLocalizations.delegate ,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales:[
        Locale("en"  , "") ,
        Locale("ar"  , "") ,
      ] ,
      locale: Locale("ar" , ""),
      localeResolutionCallback:( currentLang , supportLang ){
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              return currentLang ;
            }
          }
        }
        return supportLang.first ;
      } ,
*/
    );
  }
}
