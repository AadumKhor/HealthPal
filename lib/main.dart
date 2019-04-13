import 'package:flutter/material.dart';
import 'package:healthpal/Screens/add_pills.dart';
import 'package:healthpal/Screens/camera_upload.dart';
import 'package:healthpal/Screens/homescreen.dart';
import 'package:healthpal/Screens/profile_screen.dart';
import 'package:healthpal/Screens/treatment_history.dart';
import 'package:healthpal/Screens/calorie.dart';
import 'package:healthpal/Screens/splash.dart';
import 'package:healthpal/Screens/register.dart';

Color color = Color(0xff1d4ec7);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthPal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: HomeScreen(),
      routes: {
        '/user':(context) => ProfileScreen(),
        '/treat_his': (context) => Treatment(),
        '/pills':(context) => PillsScreen(),
        '/addFood': (context) => Meal(),
        '/homescreen': (context) => HomeScreen(),
        '/camera_upload':(context) => CameraUpload(),
        '/register': (context) => Register()
      }
    );
  }
}