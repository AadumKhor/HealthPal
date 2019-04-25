import 'package:flutter/material.dart';
import 'package:healthpal/screen_aware.dart';
import 'details_1.dart';
import 'package:flutter_svg/svg.dart';

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {

  int weight;

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
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: _drawSlider(),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context , constraints)=> WeightSlider(
          minValue: 30,
          maxValue: 110,
          value: weight,
          onChanged: (val) => setState(() => weight = val),
          width: constraints.maxWidth
        ),
      ),
    );
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
          width: double.infinity,
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
// just a comment
class WeightSlider extends StatelessWidget {
  int maxValue, minValue , value;
  final ValueChanged<int> onChanged;
  double width;

  WeightSlider({Key key, this.maxValue, this.minValue, this.width ,  this.onChanged , this.value})
      : super(key: key);

  double get itemExtent => width / 3;
  int _indexToValue(int index) => minValue + (index - 1);

  @override
  Widget build(BuildContext context) {
    int itemCount = (maxValue - minValue) + 3;
    return NotificationListener(
      onNotification: _onNotification,
          child: ListView.builder(
        itemCount: itemCount,
        itemExtent: itemExtent,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final int value = _indexToValue(index);
          bool isExtra = index == 0 || index == itemCount - 1;

          return isExtra
              ? new Container()
              : Center(
                  child: Text(
                    value.toString(),
                    style: _getTextStyle(value),
                  ),
                );
        },
      ),
    );
  }

  int _offsetToMiddleIndex(double offset) => ((width + offset) /2 ) ~/ itemExtent;

  int _offsetToMiddleValue(double offset){
    int _indexOfMiddleElement = _offsetToMiddleIndex(offset);
    int middleValue = _indexToValue(_indexOfMiddleElement);
    return middleValue;
  }

  bool _onNotification(Notification notification){
    if(notification is ScrollNotification){
      int middleValue  = _offsetToMiddleValue(notification.metrics.pixels);

      if(middleValue != value){
        onChanged(middleValue);
      }
    }
    return true;
  }

  TextStyle _getDefaultTextStyle() {
    return new TextStyle(
      color: Color.fromRGBO(196, 197, 203, 1.0),
      fontSize: 13.0,
    );
  }

  TextStyle _getHighlightedTextStyle(){
    return new TextStyle(
      color: Colors.blue,
      fontSize: 28.0
    );
  }

  TextStyle _getTextStyle(int itemValue){
    return itemValue == value 
      ? _getHighlightedTextStyle()
      :_getDefaultTextStyle();
  }
}
