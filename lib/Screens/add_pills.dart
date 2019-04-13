import 'package:flutter/material.dart';

class PillsScreen extends StatefulWidget {
  @override
  _PillsScreenState createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFF1D4EC7),
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Text('Pills Name' , style: TextStyle(color: Colors.black , fontSize: 24.0),),
            Container(
              height: 40.0,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
              ),
            )
          ],
        ),
      )
    );
  }
}
