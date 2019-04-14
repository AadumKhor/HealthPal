import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/homescreen');
      SnackBar(
        content: Text('Data has been added successfully',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: FlareActor(
          'assets/flare/tickloader.flr',
          fit: BoxFit.cover,
          alignment: Alignment.center,
          animation: 'tickloader',
        ),
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         colors: [
        //       Colors.indigo[400],
        //       Colors.indigo[600],
        //       Colors.indigo[800]
        //     ])),
      ),
    );
  }
}
