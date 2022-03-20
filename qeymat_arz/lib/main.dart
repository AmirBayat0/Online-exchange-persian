import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // Persian
      ],
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          //
          //* for Negative num
          headline3: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.red,
          ),
          //
          //* for Postive num
          headline4: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.green,
          ),
          bodyText1: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Color.fromARGB(255, 82, 82, 82),
          ),
        ),
      ),
      title: "قیمت ارز ها",
      home: const HomeScreen(),
    );
  }
}
