import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthpal/BMI/details_1.dart';
import 'package:healthpal/Screens/add_pills.dart';
import 'package:healthpal/Screens/camera_upload.dart';
import 'package:healthpal/Screens/homescreen.dart';
import 'package:healthpal/Screens/loader.dart';
import 'package:healthpal/Screens/login.dart';
import 'package:healthpal/Screens/pill_list_screen.dart';
import 'package:healthpal/Screens/profile_screen.dart';
import 'package:healthpal/Screens/success.dart';
import 'package:healthpal/Screens/treatment_history.dart';
import 'package:healthpal/Screens/calorie.dart';
import 'package:healthpal/Screens/splash.dart';
import 'package:healthpal/Screens/register.dart';
import 'package:healthpal/Screens/camera_upload.dart';

Color color = Color(0xff1d4ec7);

void main() {
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HealthPal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: DetailsPartOne(),
        routes: {
          '/user': (context) => ProfileScreen(),
          '/treat_his': (context) => Treatment(),
          '/pills': (context) => PillsScreen(),
          '/addbf': (context) => Meal(),
          '/addlunch': (context) => Meal2(),
          '/adddin': (context) => Meal3(),
          '/home': (context) => HomeScreen(),
          '/camera_upload': (context) => CameraUpload(),
          '/register': (context) => Register(),
          '/calorie': (context) => Calorie(),
          '/camera': (context) => CameraUpload(),
          '/loader': (context) => Loader(),
          '/success': (context) => Success(),
          '/login': (context) => LoginPage(),
          '/details1':(context) => DetailsPartOne()
        });
  }
}
