import 'package:bidyutbillchecker/utills/app_colors.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appThemeColor,
      body:  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "বিদ্যুৎ বিল",
              style: TextStyle(fontSize: 21,color: AppColors.appTextColor),
              textAlign: TextAlign.center,
            ))
          ],
        ),
      ),
    );
  }
}
