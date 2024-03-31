import 'package:bidyutbillchecker/utills/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  Widget child;
   ContainerBox({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.appThemeColor,
        border: Border.all(color: AppColors.appTextColor),
      ),
      child: child,
    );
  }
}
