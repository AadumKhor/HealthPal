import 'package:flutter/material.dart';
import 'package:flutter/src/services/platform_channel.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:platform/src/interface/platform.dart';
// import 'package:stream_channel/stream_channel.dart';

class PillsScreen extends StatefulWidget {
  @override
  _PillsScreenState createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int pillTimes = 2;
  int pillCount = 0;
  int pillDuration = 0;

  TimeOfDay _time = TimeOfDay(hour: 9, minute: 0);

  bool isTimeSet1 = false;
  bool isTimeSet2 = false;

  static String capsuleImage = 'assets/images/capsule.png';
  static String solutionImage = 'assets/images/solution.png';
  static String tabletImage = 'assets/images/tablet.png';

  static String capsuleSelected = 'assets/images/capsule_selected.png';
  static String solutionSelected = 'assets/images/solution_selected.png';
  static String tabletSelected = 'assets/images/tablet_selected.png';

  bool capsule = false;
  bool solution = false;
  bool tablet = false;

  String selectedType = '';

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: pillTimes);
    super.initState();
  }

  Future getNotification() async {
    var time = new Time(10, 0, 0);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    MethodChannel channel = new MethodChannel('Notifs');
    Platform platform;

    var notif = FlutterLocalNotificationsPlugin.private(channel, platform);
    await notif.showDailyAtTime(
        0, 'Reminder', 'Medicine Time!', time, platformChannelSpecifics);
  }

  Future<Null> setTime(BuildContext context) async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (time != null && time != _time) {
      setState(() {
        _time = time;
        if (_tabController.index == 0) {
          isTimeSet1 = true;
          // isTimeSet2 = false;
        } else if (_tabController.index == 1) {
          isTimeSet2 = true;
          // isTimeSet1 = false;
        }
      });
    }
  }

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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Text(
                'Pills Name',
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
              Container(
                height: 50.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Color(0xFF1D4EC7))),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Name of pill', border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Add number',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Add duration',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            height: 40.0,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pillCount = pillCount - 1;
                                  });
                                },
                                child: Icon(Icons.exposure_neg_1,
                                    color: Colors.white)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.blue[400],
                                      Colors.blue[600],
                                      Colors.blue[900]
                                    ])),
                          ),
                          Text(
                            pillCount.toString(),
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pillCount = pillCount + 1;
                                  });
                                },
                                child:
                                    Icon(Icons.plus_one, color: Colors.white)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.blue[400],
                                      Colors.blue[600],
                                      Colors.blue[900]
                                    ])),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 120,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            height: 40.0,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pillDuration = pillDuration - 1;
                                  });
                                },
                                child: Icon(Icons.exposure_neg_1,
                                    color: Colors.white)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.blue[400],
                                      Colors.blue[600],
                                      Colors.blue[900]
                                    ])),
                          ),
                          Text(
                            pillDuration.toString(),
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pillDuration = pillDuration + 1;
                                  });
                                },
                                child:
                                    Icon(Icons.plus_one, color: Colors.white)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.blue[400],
                                      Colors.blue[600],
                                      Colors.blue[900]
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Medicine form',
                style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        capsule = !capsule;
                        selectedType = 'Capsule';
                      },
                      child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: capsule
                                    ? AssetImage(capsuleSelected)
                                    : AssetImage(capsuleImage),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        solution = !solution;
                        selectedType = 'Solution';
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: solution
                                  ? AssetImage(solutionSelected)
                                  : AssetImage(solutionImage),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        tablet = !tablet;
                        selectedType = 'Tablet';
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: tablet
                                  ? AssetImage(tabletSelected)
                                  : AssetImage(tabletImage),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.maxFinite,
                height: 50.0,
                child: DefaultTabController(
                  length: pillTimes,
                  child: TabBar(
                    labelColor: Color(0xFF1D4EC7),
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(
                        text: 'Time 1',
                      ),
                      Tab(
                        text: 'Time 2',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 100.0,
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    !isTimeSet1
                        ? RaisedButton(
                            onPressed: () {
                              setTime(context);
                            },
                          )
                        : Center(
                            child: Text(
                              _time.toString(),
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.black),
                            ),
                          ),
                    !isTimeSet2
                        ? RaisedButton(
                            onPressed: () {
                              setTime(context);
                            },
                          )
                        : Center(
                            child: Text(
                              _time.toString(),
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.black),
                            ),
                          )
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 100.0,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue),
                  child: FlatButton(
                    child: Text('Add'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loader');
                      getNotification();
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
