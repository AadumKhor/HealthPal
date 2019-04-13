import 'package:flutter/material.dart';
import 'package:healthpal/main.dart';

String meal;
int roti = 0;
bool adbf = false;
int curd = 0;
int index = 0; 

class Calorie extends StatefulWidget {
  @override
  _CalorieState createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calorimeter',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 8),
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  'Breakfast',
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 200),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    index = 0;
                    meal = 'Breakfast';
                    Navigator.pushNamed(context, '/addFood');
                  },
                )
              ],
            ),
          ),
          adbf ? bf() : SizedBox(height: 0),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 8),
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  'Lunch',
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 240,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    index = 1;
                    meal = 'Lunch';
                    Navigator.pushNamed(context, '/addFood');
                  },
                )
              ],
            ),
          ),
          adbf ? bf() : SizedBox(height: 0),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 8),
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  'Dinner',
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 235),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    index = 2;
                    meal = 'Dinner';
                    Navigator.pushNamed(context, '/addFood');
                  },
                )
              ],
            ),
          ),
          adbf ? bf() : SizedBox(height: 0),
        ],
      ),
    );
  }
}

class Meal extends StatefulWidget {
  @override
  _MealState createState() => _MealState();
}

class _MealState extends State<Meal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
          'Add $meal',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: color,
            margin: EdgeInsets.only(left: 10, right: 10, top: 8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text('Roti',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
                SizedBox(width: 230),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {
                    roti++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$roti',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          Card(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: color,
            margin: EdgeInsets.only(left: 10, right: 10, top: 8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text('Curd',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
                SizedBox(width: 230),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {
                    curd++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$curd',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              adbf = true;
            },
            child: Text('ADD'),
          )
        ],
      ),
    );
  }
}

Widget bf() {
  int total = roti*297 + curd*100;
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Roti: $roti, Calories: ${roti*297}', style: TextStyle(color: Colors.grey, fontSize: 15)),
        Text('Curd: $curd gm, Calories: ${curd*100}', style: TextStyle(color: Colors.grey, fontSize: 15)),
        Text('Total calories: $total', style: TextStyle(color: Colors.grey, fontSize: 25))
      ],
    ),
  );
}
