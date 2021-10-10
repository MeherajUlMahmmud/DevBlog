import 'package:flutter/material.dart';

class Constants {
  static String API = "http://192.168.0.108/api/";
  static String BLOG_API = API + "blog/";
  static String USER_API = API + "user/";

  static String loginUrl = USER_API + "login/";
  static String registerUrl = USER_API + "register/";


  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.black;
  static Color darkAccent = Colors.red[400];
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );
}
