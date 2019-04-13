import 'package:flutter/material.dart';
import 'package:healthpal/Data/personal_data.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  // int index;
  var graphData = [1.0, 2.0, 3.4, 5.4, 6.0, 5.7, 5.9, 4.0, 3.0, 3.1];
  List<PersonalData> data = [
    PersonalData(height: 172, weight: 70, blood: 'O+', age: 19),
    // add more items and take data from server
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back, color: Color(0xFF1D4EC7)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          // child: Stack(children: <Widget>[
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          // TODO:add name from data taken from server
                          'Aayush Malhotra',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text('Add address here',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 20.0,
                        ),
                        iconWithData(data[0]),
                        iconWithData(data[0]),
                      ],
                    ),
                    SizedBox(
                      width: 100.0,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.black)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all()),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  // child: Chart(
                  child: Sparkline(
                    data: graphData,
                    lineColor: Colors.lightBlue,
                    sharpCorners: true,
                    lineWidth: 3.0,
                  ),
                ),
              ),
              // ),
              SizedBox(
                height: 20.0,
              ),
              // ListView(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.horizontal,
              //   children: <Widget>[
              //     _diseaseCard('Diabetes', '27/09/16', 'Medication')
              //   ],
              // )
              Container(
                width: double.maxFinite,
                height: 60.0,
                child: TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Chronic Diseases',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Medication',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 150.0,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    _diseaseCard('disease', 'date', 'status'),
                    _diseaseCard('BC', 'date', 'status')
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    highlightColor: Color(0xFF1D4EC7),
                    splashColor: Color(0xFF1D4EC7),
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      Navigator.pushNamed(context, '/treat_his');
                    },
                    child: Container(
                        height: 50.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blue[50],
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Text(
                                'Treatment History',
                                style: TextStyle(
                                    color: Color(0xFF031A98),
                                    fontSize: 20.0,
                                    letterSpacing: 2.0),
                              ),
                            ),
                            SizedBox(
                              width: 100.0,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF1D4EC7),
                                ))
                          ],
                        )),
                  ))
            ],
          ),

          // ]),
        ));
  }

  Widget iconWithData(PersonalData pdata) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: 50.0,
            height: 50.0,
            child: Image.asset(
              'assets/images/calender.png',
              fit: BoxFit.contain,
            )),
        SizedBox(
          width: 10.0,
        ),
        Column(
          children: <Widget>[
            Text(pdata.age.toString()),
            Text(pdata.blood),
          ],
        ),
        Icon(Icons.block),
        SizedBox(
          width: 10.0,
        ),
        Column(
          children: <Widget>[
            Text(pdata.height.toString()),
            Text(pdata.weight.toString()),
          ],
        ),
      ],
    );
  }

  Widget _diseaseCard(String disease, String date, String status) {
    return Container(
      height: 70.0,
      width: 90.0,
      child: Card(
        color: Color(0xFF031A98),
        child: Column(
          children: <Widget>[
            Text(
              date,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            Text(disease,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500)),
            Text(
              status,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
