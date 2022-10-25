import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/weatherCont.dart';
import 'pages/myHomePage.dart';

void main() {
  runApp(ChangeNotifierProvider<weatherController>(
    create: (_) => weatherController(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    weatherController objWatch = context.watch<weatherController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: objWatch.col,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                // ignore: prefer_const_constructors
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
                backgroundColor: MaterialStateProperty.all(
                    context.watch<weatherController>().col.withOpacity(.6)))),
        textTheme: const TextTheme(
            headline4:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            headline5:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            headline6: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16)),
      ),
      home: const intro(),
    );
  }
}

// ignore: use_key_in_widget_constructors

class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.network(
            'https://www.pngall.com/wp-content/uploads/11/Weather-No-Background.png'),
        durationInSeconds: 3,
        logoWidth: 70,
        navigator: MyHomePage(),
        loaderColor: Colors.blue,
        gradientBackground: LinearGradient(
          colors: [Colors.blue.withOpacity(.3), Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
