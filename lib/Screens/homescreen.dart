import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:healthpal/main.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{  

  AnimationController _controller;
  List<IconData> icons = [Icons.dialpad , Icons.person];
  @override
  void initState() {
    _controller = new AnimationController(vsync: this , duration: Duration(milliseconds: 200));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.red;
    Color foregroundColor = Colors.white;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton:  new Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(
                  0.0,
                  1.0 - index / icons.length / 2.0,
                  curve: Curves.easeOut
                ),
              ),
              child: new FloatingActionButton(
                heroTag: null,
                backgroundColor: backgroundColor,
                mini: true,
                child: new Icon(icons[index], color: foregroundColor),
                onPressed: () {},
              ),
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            backgroundColor: Colors.red,
            heroTag: null,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.phone_in_talk : Icons.close),
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

int show = 0;
var height = 50.0;
Icon icon = Icon(Icons.arrow_downward);

Widget content() {
  if (show == 1) {
    return TextField(
      decoration: InputDecoration(hintText: 'Enter food item'),
    );
  }
  return SizedBox(height: 1);
}

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      margin: EdgeInsets.only(left: 16, right: 16, top: 8),
      child: GestureDetector(
        onTap: () {
          color = Colors.indigo;
          height = 70;
          icon = Icon(Icons.arrow_upward);
          show = 1;
          setState(() {});
        },
        child: AnimatedContainer(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
            duration: Duration(seconds: 1),
            height: height,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Breakfast',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          color = Colors.indigo[300];
                          height = 70;
                          icon = Icon(Icons.arrow_downward);
                          show = 0;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  content()
                ],
              ),
            )),
      ),
    );
  }
}
