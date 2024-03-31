import 'package:bidyutbillchecker/controller_binder.dart';
import 'package:bidyutbillchecker/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      theme: ThemeData(
          textTheme:
              const TextTheme(
                bodyText1: TextStyle(color: Color(0xff00BFFF)), // for body text
                headline1: TextStyle(color: Color(0xff00BFFF)), // for headlines
              ),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: Colors.black),
      home: const SplashView(),
    );
  }
}
