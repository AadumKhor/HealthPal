import 'package:flutter/material.dart';
import 'package:healthpal/screen_aware.dart';
import 'details_1.dart';
import 'package:flutter_svg/svg.dart';

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(screenAwareSize(32, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          CardTitle(
            title: 'WEIGHT',
            subtitle: 'in KG',
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: _drawSlider(),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground();
  }
}

class WeightBackground extends StatelessWidget {
  final Widget child;

  WeightBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(100.0, context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1.0),
            borderRadius: BorderRadius.circular(screenAwareSize(50, context)),
          ),
          child: child,
        ),
        SvgPicture.asset(
          "images/weight_arrow.svg",
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(18.0, context),
        ),
      ],
    );
  }
}
