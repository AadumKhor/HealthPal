import 'package:flutter/material.dart';
import '../Data/personal_data.dart';
import 'profile_screen.dart';
// import 'package:charts_flutter/flutter.dart';

class Treatment extends StatefulWidget {
  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {

  // int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/user");
            },
            child: Icon(Icons.arrow_back, color: Color(0xFF1D4EC7))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Treatment History',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500)),
            Text('Aayush Malhotra'),

            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 200.0,
              width: double.maxFinite,
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/graph.png'),
                  
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Timeline',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                ),
                Text('All events in detail')
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.maxFinite,
              height: 200.0,
              child: Stack(
                children: <Widget>[                
                ListView.separated(
                  itemCount: 365,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      width: 40.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 9.0,
                            height: 180.0,
                            child: Card(
                              color: Colors.black26,
                            ),
                          ),
                          Text('$index')
                        ],
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Colors.black,
                      ),
                ),
                Container(
                  height: 50.0,
                  width: 100.0,
                  child: Card(
                    color: Colors.red,
                  ),
                )
              ]),
            )
            // Stack(
            //   children: <Widget>[
            //     Container(
            //       width: double.maxFinite,
            //       height: 100.0,
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage(''),
            //           fit: BoxFit.cover
            //         )
            //       ),
            //     ),

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
