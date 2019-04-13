import 'package:flutter/material.dart';
import 'package:healthpal/Data/personal_data.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ProfileScreen extends StatefulWidget {
  //   final List<charts.Series> seriesList;
  // final bool animate;

  // ProfileScreen(this.seriesList, {this.animate});

  // /// Creates a [TimeSeriesChart] with sample data and no transition.
  // factory ProfileScreen.withSampleData() {
  //   return new ProfileScreen(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  // static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
  //   final data = [
  //     new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
  //     new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
  //     new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
  //     new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
  //   ];

  //   return [
  //     new charts.Series<TimeSeriesSales, DateTime>(
  //       id: 'Sales',
  //       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //       domainFn: (TimeSeriesSales sales, _) => sales.time,
  //       measureFn: (TimeSeriesSales sales, _) => sales.sales,
  //       data: data,
  //     )
  //   ];
  // }
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  // int index;
  var graphData = [1.0, 2.0, 3.4, 5.4, 6.0, 5.7, 5.9, 4.0, 3.0, 3.1];
  // var xAxis = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[
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
                            borderRadius: BorderRadius.circular(30.0),
                          ),
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
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 800.0,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/images/graph.png',
                              fit: BoxFit.fill),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Sparkline(
                            data: graphData,
                            lineColor: Colors.blue,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
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
                    _diseaseCard('Diabetes', '27/03/16', 'OnGoing'),
                    _diseaseCard('Ibuprofen', '27/03/16', 'OnGoing')
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
          )
          // ]),
        ));
  }

  // Widget _graph(BuildContext context){
  //   return charts.TimeSeriesChart(

  //   );
  // }

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
    return ListView(
      children: <Widget>[
        Card(
          child: Container(
            height: 200.0,
            width: 90.0,
            decoration: BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(colors: [
                  Colors.blue[400],
                  Colors.blue[800],
                  Colors.blue[900]
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today ,color: Colors.white,),
                    SizedBox(width: 10.0,),
                    Text(
                      date,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(disease,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      status,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        
      ],
    );
  }
  // Sample time series data type.
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
