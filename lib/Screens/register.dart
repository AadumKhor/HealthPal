import 'package:flutter/material.dart';
import 'package:healthpal/main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Image(
              image: AssetImage('assets/images/hplogo.png'),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: 'NAME'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: 'AGE'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: 'GENDER'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: 'BLOUD GROUP'
              ),
            ),
            SizedBox(height: 5),
            RaisedButton(
              padding: EdgeInsets.only(left: 50, right: 50),
              onPressed: () => Navigator.pushNamed(context, '/homescreen'),
              child: Text('SUBMIT'),
              color: color,
            )
          ],
        ),
      )
    );
  }
}