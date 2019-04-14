import 'package:flutter/material.dart';
import 'package:healthpal/Data/personal_data.dart';
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
  String name = cname.text;
  String gen = cgen.text;
  String bg = cbg.text;
  var age = cage.text;
  var ht = cht.text;
  var wt = cwt.text;
  static int index = -1;

  static List<PersonalData> submittedData = [];
  static PersonalData personalData = submittedData[index];
  static List<PersonalData> dummyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          margin: EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //     gradient: RadialGradient(
          //         center: Alignment.topRight,
          //         radius: 0.05,
          //         colors: [
          //       Colors.indigo[200],
          //       Colors.indigo[400],
          //       Colors.indigo[600]
          //     ])),
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.blue[900], Colors.white],
                  center: Alignment(1, -3),
                  radius: 2)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Image(
                image: AssetImage('assets/images/hplogo.png'),
              ),
              SizedBox(height: 5),
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: cname,
                  decoration: InputDecoration.collapsed(
                    hintText: 'NAME',
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: TextField(
                  onSubmitted: (value) {
                    personalData.age = cage.value.toString();
                  },
                  textAlign: TextAlign.center,
                  controller: cage,
                  decoration: InputDecoration.collapsed(hintText: 'AGE'),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: TextField(
                  onSubmitted: (value) {
                    personalData.gender = cgen.value.toString();
                  },
                  textAlign: TextAlign.center,
                  controller: cgen,
                  decoration: InputDecoration.collapsed(hintText: 'GENDER'),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: TextField(
                  onSubmitted: (value) {
                    personalData.blood = cbg.value.toString();
                  },
                  textAlign: TextAlign.center,
                  controller: cbg,
                  decoration:
                      InputDecoration.collapsed(hintText: 'BLOUD GROUP'),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: TextField(
                  onSubmitted: (value) {
                    personalData.height = cht.value.toString();
                  },
                  textAlign: TextAlign.center,
                  controller: cht,
                  decoration: InputDecoration.collapsed(hintText: 'HEIGHT'),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  onSubmitted: (value) {
                    setState(() {
                      personalData.weight = cwt.value.toString();
                    });
                  },
                  textAlign: TextAlign.center,
                  controller: cwt,
                  decoration: InputDecoration.collapsed(hintText: 'WEIGHT'),
                ),
              ),
              SizedBox(height: 10),
              // RaisedButton(
              //   padding: EdgeInsets.only(left: 50, right: 50),
              //   onPressed: () => Navigator.pushNamed(context, '/homescreen'),
              //   child: Text('SUBMIT' , style: TextStyle(color: Colors.white , fontSize: 30.0 , fontWeight: FontWeight.w500),),
              //   color: Colors.blue[700],
              // )
              Container(
                width: 70.0,
                height: 70.0,
                child: GestureDetector(
                    onTap: () {
                      // index = index+1;
                      dummyList = [
                        PersonalData(
                            name: cname.text,
                            gender: cgen.text,
                            blood: cbg.text,
                            age: cage.text,
                            height: cht.text,
                            weight: wt)
                      ];
                      submittedData.addAll(dummyList);
                      Navigator.pushNamed(context, '/loader');
                      index = index +1;
                      print(submittedData[index].height);
                    },
                    child: Icon(Icons.arrow_forward, color: Colors.white)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.blue[700],
                ),
              )
            ],
          ),
        ));
  }
}
