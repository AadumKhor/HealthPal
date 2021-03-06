import 'package:flutter/material.dart';
import 'package:healthpal/screen_aware.dart';
import 'details_1.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';

enum Gender { male, female, other }

class GenderCard extends StatefulWidget {
  final Gender initialGender;

  const GenderCard({this.initialGender, Key key}) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard>
    with SingleTickerProviderStateMixin {
  Gender selectedGender;
  AnimationController _controller;

  @override
  void initState() {
    selectedGender = widget.initialGender ?? Gender.other;
    _controller = new AnimationController(
        lowerBound: -_defaultAngle,
        upperBound: _defaultAngle,
        vsync: this,
        value: _genderAngle[selectedGender]);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              Padding(
                padding: EdgeInsets.all(6.0),
                child: _drawMainStack(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawMainStack() {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _drawCircle(),
          GenderIcons(
            gender: Gender.female,
          ),
          GenderIcons(
            gender: Gender.other,
          ),
          GenderIcons(
            gender: Gender.male,
          ),
          _drawGestureDetector()
        ],
      ),
    );
  }
  Widget _drawCircle() {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[GenderCircle(), GenderArrow(angle: _genderAngle[Gender.other],listenable : _controller)],
  );
}

  _drawGestureDetector() {
    return Positioned.fill(
      child: TapHandler(
        onGenderTapped: (gender) => setState((){
          selectedGender = gender;
          _controller.animateTo(
            _genderAngle[gender],
            duration: Duration(milliseconds: 500)
          );
        }),
      ),
    );
  }
}

class GenderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenAwareSize(80.0, context),
      height: screenAwareSize(80.0, context),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
    );
  }
}

const _defaultAngle = math.pi / 4;
const Map<Gender, double> _genderAngle = {
  Gender.female: -_defaultAngle,
  Gender.male: _defaultAngle,
  Gender.other: 0.0
};

// * when the gender is not seleceted we show a line
class GenderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenAwareSize(6.0, context),
        top: screenAwareSize(8.0, context),
      ),
      child: Container(
        height: screenAwareSize(8.0, context),
        width: 1.0,
        color: Color.fromRGBO(216, 217, 223, 0.54),
      ),
    );
  }
}

// * gender icons to be shown for the user to choose from
class GenderIcons extends StatelessWidget {
  static const Map<Gender, String> _genderImages = {
    Gender.female: '',
    Gender.male: '',
    Gender.other: ''
  };

  final Gender gender;

  const GenderIcons({this.gender, Key key}) : super(key: key);

  double _iconSize(BuildContext context) => screenAwareSize(16.0, context);

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.all(16.0),
      child: Image.asset(
        '',
        height: _iconSize(context),
        width: _iconSize(context),
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -_genderAngle[gender],
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(80.0, context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rotatedIcon,
          GenderLine(),
        ],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: _genderAngle[gender],
      child: iconWithALine,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(80.0, context) / 2),
      child: rotatedIconWithALine,
    );
    return centeredIconWithALine;
  }
}

class GenderArrow extends StatelessWidget {
  final double angle;
  final Listenable listenable;

  const GenderArrow({Key key, this.angle , this.listenable}) : super(key: key);

  double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);

  double _translationOffset(BuildContext context) =>
      _arrowLength(context) * -0.4;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0.0, _translationOffset(context)),
        child: Transform.rotate(
          angle: -_defaultAngle,
          child: Image.asset(
            "",
            height: _arrowLength(context),
            width: _arrowLength(context),
          ),
        ),
      ),
    );
  }
}

class TapHandler extends StatelessWidget {
  final Function(Gender) onGenderTapped;

  const TapHandler({Key key, this.onGenderTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.female))),
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.other))),
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.male))),
      ],
    );
  }
}
