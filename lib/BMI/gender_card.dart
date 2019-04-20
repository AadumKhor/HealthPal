import 'package:flutter/material.dart';
import 'package:healthpal/screen_aware.dart';
import 'details_1.dart';

enum Gender { male, female, other }

class GenderCard extends StatefulWidget {
  final Gender initialGender;

  const GenderCard({this.initialGender, Key key}) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardTitle(title: "GENDER"),
            ],
          ),
        ),
      ),
    );
  }
}
