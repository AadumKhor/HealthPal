import 'package:flutter/material.dart';
import 'package:healthpal/main.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //TODO; add our logo here
      //TODO: put animated container screen here
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              child: Icon(Icons.access_alarms),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.red
              ),
            ),
          )
        ],
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
