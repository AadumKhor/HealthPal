import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:healthpal/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flare_flutter/flare_actor.dart';

int show1 = 0;
int show2 = 0;
int show3 = 0;
var height = 200.0;
Icon icon = Icon(Icons.arrow_downward);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<IconData> icons = [Icons.dialpad, Icons.person];
  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  Widget content1() {
    if (show1 == 1) {
      return RaisedButton(
        child: Text(
          'Add diet',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/calorie');
        },
      );
    } else
      return SizedBox(height: 0);
  }

  Widget content2() {
    if (show2 == 1) {
      return RaisedButton(
        child: Text('Upload'),
        onPressed: () {
          Navigator.pushNamed(context, '/camera');
        },
      );
    } else
      return SizedBox(height: 1);
  }

  Widget content3() {
    if (show3 == 1) {
      return RaisedButton(
        child: Text('Add diet'),
        onPressed: () {
          Navigator.pushNamed(context, '/calorie');
        },
      );
    }
    return SizedBox(height: 1);
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.red;
    Color foregroundColor = Colors.white;

    bool isOpen = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [color, Colors.white],
                    center: Alignment(1, -3),
                    radius: 2)),
            height: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 60,
                  left: 20,
                  child: Text('Hello',
                      style: TextStyle(
                          color: color,
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
                ),
                Positioned(
                    top: 100,
                    left: 20,
                    child: GestureDetector(
                      child: Text('Divyansh',
                          style: TextStyle(
                              color: color,
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                      onTap: () => Navigator.pushNamed(context, '/user'),
                    ))
              ],
            ),
          ),
          Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            margin: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [color, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0, 10],
                      tileMode: TileMode.clamp)),
              duration: Duration(seconds: 1),
              height: height,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    FlareActor(
                      'assets/flare/calorymeter.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      animation: 'Untitled',
                    ),
                    SizedBox(width: 10),
                    Center(
                      child: Text('DIET',
                          style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            letterSpacing: 3.0,
                            color: Colors.white)),
                    ),
                    isOpen ? Container(width: 100.0, height: 40.0,color: Colors.white,) : SizedBox(height: 0.0)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            margin: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [color, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0, 10],
                      tileMode: TileMode.clamp)),
              duration: Duration(seconds: 1),
              height: height,
              child: Stack(
                children: <Widget>[
                  FlareActor(
                    'assets/flare/cameraflash.flr',
                    animation: 'Untitled',
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      height = 250;
                      show2 = 1;
                      setState(() {
                        // isOpen = !isOpen;
                      });
                    },
                    child: Center(
                      child: Text('UPLOAD',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              letterSpacing: 3.0,
                              color: Colors.white)),
                    ),
                  ),
                  content2()
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            margin: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [color, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      )),
              duration: Duration(seconds: 1),
              height: height,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    FlareActor(
                      'assets/flare/sunriseset.flr',
                      fit: BoxFit.cover,
                      animation: 'sunriseset',
                      alignment: Alignment.center,
                    ),
                    SizedBox(width: 10),
                    Text('ACTIVITY',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white)),
                    SizedBox(width: 50),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        height = 250;
                        show3 = 1;
                        setState(() {});
                      },
                    ),
                    content3()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: new Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOut),
              ),
              child: new FloatingActionButton(
                heroTag: null,
                backgroundColor: backgroundColor,
                mini: true,
                child: new Icon(icons[index], color: foregroundColor),
                onPressed: () {
                  if (index == 0) {
                    // launch(urlString); // call the doctor
                  } else {
                    // launch(urlString) // call ambulance
                  }
                },
              ),
            ),
          );
          return child;
        }).toList()
          ..add(
            new FloatingActionButton(
              backgroundColor: Colors.red,
              heroTag: null,
              child: new AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return new Transform(
                    transform: new Matrix4.rotationZ(
                        _controller.value * 0.5 * math.pi),
                    alignment: FractionalOffset.center,
                    child: new Icon(_controller.isDismissed
                        ? Icons.phone_in_talk
                        : Icons.close),
                  );
                },
              ),
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
            ),
          ),
      ),
    );
  }
}
