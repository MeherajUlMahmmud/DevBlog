import 'package:flutter/material.dart';
import 'package:flutter_mobile/screens/navigation_main_screen.dart';
import 'package:flutter_mobile/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Constants.lightTheme,
      home: NavigationMainScreen(),
    );
  }
}
