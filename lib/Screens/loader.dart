import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = new AnimationController(vsync: this , duration: Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController , curve: Curves.easeInOut);
    //Timer(duration: Duration(seconds: 4), void callback() );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: FlareActor(
            'assets/flare/waveloader2.0.flr',
            animation: 'Untitled',
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}