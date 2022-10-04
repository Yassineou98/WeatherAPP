import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/screens/first_screen.dart';
import 'package:weatherapp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      // ignore: prefer_const_constructors
      home: FirstScreen(),
      title: "WeatherAPP",
      debugShowCheckedModeBanner: false,
    );
  }
}
