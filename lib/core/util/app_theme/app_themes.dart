import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors/app_colors.dart';

class AppThemes{

  static final ThemeData lightTheme=ThemeData(

    scaffoldBackgroundColor: AppColors.backgroundVerify,
    primarySwatch: Colors.blue,
    tabBarTheme: TabBarTheme(
        labelColor: AppColors.blueColor,
        labelStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
            color: AppColors.backgroundColor
        ),
        unselectedIconTheme: IconThemeData(
            color: Colors.grey
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.backgroundColor,
        unselectedItemColor: Colors.grey
    ),
    fontFamily: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,

    ).fontFamily,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.white,
        titleTextStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(
            color: Colors.black,
            size: 30
        )
    ),

    textTheme: TextTheme(
        labelMedium: TextStyle(
            fontSize: 47.sp,
            color: AppColors.textGreyColor,
            fontWeight: FontWeight.w500),

        headline1: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.greenMainColor),
        headline2: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
            height: 1.5,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: AppColors.textWhiteColor),
        headline4: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26.sp,
            color: AppColors.textWhiteColor),
        headline5: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            height: 1.5,
            fontWeight: FontWeight.bold),
        headline6: TextStyle(
          fontSize: 18.sp,
          color: AppColors.orangeColor,

        ),
        bodyText1: TextStyle(
            color: AppColors.mainColor,
            fontSize: 20.sp
        ),
        caption: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.captionColor
        ),
        headlineLarge: TextStyle(
          fontSize: 12.sp,
          color: Colors.black,
        )
    ),
  );

}