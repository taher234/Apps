import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/controllers/controller.dart';
import 'package:task1/intro.dart';

void main() {
  runApp(ChangeNotifierProvider<control>(
    create: (_) => control(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))))),
          textTheme: const TextTheme(
            headline3: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Gilroy'),
            headline5: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Gilroy'),
            headline4: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontFamily: 'Gilroy'),
            headline6: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontFamily: 'Gilroy'),
            bodyText1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.black,
                fontFamily: 'Gilroy'),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
          logoWidth: 100,
          logo: Image.asset('assets/images/s1.png'),
          backgroundColor: Colors.green,
          durationInSeconds: 2,
          showLoader: false,
          navigator:
              intro()), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
