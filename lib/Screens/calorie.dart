import 'package:flutter/material.dart';
import 'package:healthpal/main.dart';

int bfroti = 0;
bool adbf = false, adlun = false, addin = false;
int bfcurd = 0;
int lunroti = 0, luncurd = 0;
int dinroti = 0, dincurd = 0;
int total1 = 0, total2 = 0, total3 = 0;

class Calorie extends StatefulWidget {
  @override
  _CalorieState createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
  Widget bf() {
    total1 = bfroti * 297 + bfcurd * 100;
    setState(() {});
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Roti: $bfroti, Calories: ${bfroti * 297}',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          Text('Curd: $bfcurd gm, Calories: ${bfcurd * 100}',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          Text('Total calories: $total1',
              style: TextStyle(color: Colors.grey, fontSize: 25))
        ],
      ),
    );
  }

  Widget lun() {
    total2 = lunroti * 297 + luncurd * 100;
    setState(() {});
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Roti: $lunroti, Calories: ${lunroti * 297}',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          Text('Curd: $luncurd gm, Calories: ${luncurd * 100}',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          Text('Total calories: $total2',
              style: TextStyle(color: Colors.grey, fontSize: 25))
        ],
      ),
    );
  }

  Widget din() {
    total3 = dinroti * 297 + dincurd * 100;
    setState(() {});
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Roti: $dinroti, Calories: ${dinroti * 297}',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          Text('Curd: $dincurd gm, Calories: ${dincurd * 100}',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          Text('Total calories: $total3',
              style: TextStyle(color: Colors.grey, fontSize: 25))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[700], Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            height: 100,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30,
                  left: 30,
                  child: Text('Calorimeter',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Text('Total calories = ${total1 + total2 + total3}',
              style: TextStyle(fontSize: 30)),
          SizedBox(height: 10),
          Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 8),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [
                          Colors.blue[900],
                          Colors.blue[800],
                          Colors.blue[500]
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.clamp)),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      'Breakfast',
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(width: 200),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/addbf');
                      },
                    )
                  ],
                ),
              )),
          SizedBox(height: 10),
          adbf ? bf() : SizedBox(height: 0),
          SizedBox(height: 10),
          Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 8),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [
                          Colors.blue[900],
                          Colors.blue[800],
                          Colors.blue[500]
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.clamp)),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      'Lunch',
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(width: 200),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, '/addlunch');
                      },
                    )
                  ],
                ),
              )),
          SizedBox(height: 10),
          adlun ? lun() : SizedBox(height: 0),
          SizedBox(height: 10),
          Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 8),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [
                          Colors.blue[900],
                          Colors.blue[800],
                          Colors.blue[500]
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.clamp)),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      'Dinner',
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(width: 200),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/adddin');
                      },
                    )
                  ],
                ),
              )),
          SizedBox(height: 10),
          addin ? din() : SizedBox(height: 0),
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
          'Add Breakfast',
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
                    bfroti++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$bfroti',
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
                    bfcurd++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$bfcurd',
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

class Meal2 extends StatefulWidget {
  @override
  _Meal2State createState() => _Meal2State();
}

class _Meal2State extends State<Meal2> {
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
          'Add Lunch',
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
                    lunroti++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$lunroti',
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
                    luncurd++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$luncurd',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              adlun = true;
            },
            child: Text('ADD'),
          )
        ],
      ),
    );
  }
}

class Meal3 extends StatefulWidget {
  @override
  _Meal3State createState() => _Meal3State();
}

class _Meal3State extends State<Meal3> {
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
          'Add Dinner',
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
                    dinroti++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$dinroti',
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
                    dincurd++;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$dincurd',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              addin = true;
            },
            child: Text('ADD'),
          )
        ],
      ),
    );
  }
}
