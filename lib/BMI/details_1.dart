import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthpal/BMI/gender_card.dart';
import 'package:healthpal/BMI/weight_cards.dart';
import 'package:healthpal/screen_aware.dart';

const TextStyle _titleStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Color.fromRGBO(14, 24, 35, 1.0),
);

const TextStyle _subtitleStyle = TextStyle(
  fontSize: 8.0,
  fontWeight: FontWeight.w500,
  color: Color.fromRGBO(78, 102, 114, 1.0),
);

class DetailsPartOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          children: <Widget>[
            _buildTitle(context),
            Expanded(
              child: _buildCards(context),
            ),
            _buildBottom(context)
          ],
        ),
      ),
    );
  }
}

// * has the swtich which will be animated later on to transition
// * to the next screen
Widget _buildBottom(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: screenAwareSize(108.0, context),
    width: double.infinity,
    child: Switch(value: true, onChanged: (val) {}),
  );
}

// * checking the layout of the cards on screen
Widget _buildCards(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 14.0,
      right: 14.0,
      top: screenAwareSize(32.0, context),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(child: GenderCard()),
              Expanded(child: WeightCard()),
            ],
          ),
        ),
        Expanded(child: _tempCard("Height"))
      ],
    ),
  );
}

// ? just for the time being to check the layout
Widget _tempCard(String label) {
  return Card(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Text(label),
    ),
  );
}

// * the actual screen of the app with it's fucntionality as its title
Widget _buildTitle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 24.0,
      top: screenAwareSize(56.0, context),
    ),
    child: Text(
      "BMI Calculator",
      style: new TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    ),
  );
}

// * since we need to use the title again and again for each part.
class CardTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardTitle({this.title, Key key , this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:TextSpan(
        text: title,
        style: _titleStyle,
        children: <TextSpan>[
          TextSpan(
            text: subtitle ?? "",
            style: _subtitleStyle
          )
        ]
      ));
  }
}
