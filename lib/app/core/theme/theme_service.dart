import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../conts_txt.dart';
import '../app_colors.dart';

class AppThemeManager extends GetxService {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backGroundColor,
    primaryColor: AppColors.blue,
    backgroundColor: AppColors.backGroundColor,
    cardColor: AppColors.white,
    canvasColor: AppColors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: compactSemibold,
        fontSize: 40,
        color: AppColors.black,
        // fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        fontFamily: compactBold,
        fontSize: 32,
        color: AppColors.black,
        // fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        color: AppColors.white,
        fontFamily: compactBold,
        fontSize: 24,
      ),
      headline4: TextStyle(color: AppColors.black,fontSize: 19,fontFamily: compactRegular),

      bodyText1: TextStyle(
        fontFamily: compactBold,
        fontSize: 22,
        color: AppColors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontFamily: compactBold,
        color: AppColors.white,
      ),

      subtitle1: TextStyle(
          fontFamily: compactRegular,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.gray2),
      subtitle2: TextStyle(
          fontFamily: compactRegular,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.black),
    ),
    focusColor: AppColors.black,
    errorColor: AppColors.red,
  );
}
