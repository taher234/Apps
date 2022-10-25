import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/newsProvider.dart';
import 'package:newsapp/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<newsProvider>(
    create: (_) => newsProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: context.watch<newsProvider>().b),
              headline6: TextStyle(
                  color: context.watch<newsProvider>().b,
                  fontSize: 20,
                  fontWeight: FontWeight.w800))),
      home: intro(),
    );
  }
}

class intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.network(
            'https://cdn-icons-png.flaticon.com/512/21/21601.png'),
        gradientBackground: LinearGradient(
          colors: [Colors.grey, Colors.grey.withOpacity(.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        durationInSeconds: 3,
        navigator: home(),
      ),
    );
  }
}
