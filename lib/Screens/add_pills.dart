import 'package:flutter/material.dart';

class PillsScreen extends StatefulWidget {
  @override
  _PillsScreenState createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int pillTimes = 2;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: pillTimes);
    super.initState();
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
              Row(
                children: <Widget>[
                  Text(
                    'Add number',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Add duration',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Number', border: InputBorder.none),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Color(0xFF1D4EC7))),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  Container(
                    width: 150.0,
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Duration', border: InputBorder.none),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Color(0xFF1D4EC7))),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Medicine form'),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          //add icon
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Capsule',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          //add icon
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Pill',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          //add icon
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Solution',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  )
                ],
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
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Text('Time'),

                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 100.0,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue
                  ),
                  child: FlatButton(
                    child: Text('Add'),
                    onPressed: (){
                      Navigator.pushNamed(context, '/pill_list');
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
