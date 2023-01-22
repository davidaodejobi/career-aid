import 'package:career_aid/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme extends ChangeNotifier {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      // useMaterial3: true,
      iconTheme: const IconThemeData(
        color: AppColor.kLightPrimaryColor,
      ),
      scaffoldBackgroundColor: AppColor.kLightBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          foregroundColor: const Color(0xFFFDFDFC),
          backgroundColor:
              AppColor.kLightPrimaryColor, // foreground (text) color
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          foregroundColor: AppColor.kLightPrimaryColor,
          surfaceTintColor: AppColor.kLightPrimaryColor,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColor.kLightPrimaryColor),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColor.kLightPrimaryColor,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColor.kLightPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 72.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 36.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 30.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.w800,
        ),
        headline4: TextStyle(
          fontSize: 26.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
        headline5: TextStyle(
          fontSize: 22.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline6: TextStyle(
          fontSize: 18.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: TextStyle(
          fontSize: 16.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 12.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontSize: 10.0.sp,
          fontFamily: 'DMSans',
          color: AppColor.kLightPrimaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: AppColor.kLightPrimaryColor)
          .copyWith(secondary: AppColor.kLightPrimaryColor),
    );
  }

  /*
  
  static bool _isDarkTheme = ThemeMode.system == ThemeMode.dark ? true : false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

final appThemeProvider = ChangeNotifierProvider.autoDispose<AppTheme>((ref) {
  return AppTheme();
  */

}
