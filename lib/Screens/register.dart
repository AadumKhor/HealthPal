import 'package:flutter/material.dart';
import 'package:healthpal/main.dart';


TextEditingController cname = TextEditingController();
  TextEditingController cage = TextEditingController();
  TextEditingController cgen = TextEditingController();
  TextEditingController cbg = TextEditingController();
  TextEditingController cht = TextEditingController();
  TextEditingController cwt = TextEditingController();



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
              controller: cname,
              decoration: InputDecoration(
                hintText: 'NAME'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: cage,
              decoration: InputDecoration(
                hintText: 'AGE'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: cgen,
              decoration: InputDecoration(
                hintText: 'GENDER'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: cbg,
              decoration: InputDecoration(
                hintText: 'BLOUD GROUP'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: cht,
              decoration: InputDecoration(
                hintText: 'HEIGHT'
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: cwt,
              decoration: InputDecoration(
                hintText: 'WEIGHT'
              ),
            ),
            
            SizedBox(height: 10),
            RaisedButton(
              padding: EdgeInsets.only(left: 50, right: 50),
              onPressed: () => Navigator.pushNamed(context, '/homescreen'),
              child: Text('SUBMIT'),
              color: Colors.blue[700],
            )
          ],
        ),
      )
    );
  } 
}

String name = cname.text;
    String gen = cgen.text;
    String bg = cbg.text;
    var age = cage.text;
    var ht = cht.text;
    var wt = cwt.text;
