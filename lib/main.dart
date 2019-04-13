import 'package:flutter/material.dart';
import 'package:healthpal/Screens/add_pills.dart';
import 'package:healthpal/Screens/homescreen.dart';
import 'package:healthpal/Screens/profile_screen.dart';
import 'package:healthpal/Screens/treatment_history.dart';

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
        // '/pill_list':(context) => PillListScreen()
        
      }
    );
  }
}