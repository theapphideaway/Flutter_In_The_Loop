import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_the_loop/Business.dart';
import 'package:flutter_in_the_loop/Entertainment.dart';
import 'package:flutter_in_the_loop/Featured.dart';
import 'package:flutter_in_the_loop/Sports.dart';
import 'package:flutter_in_the_loop/Technology.dart';

import 'Health.dart';
import 'Science.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      length: 7,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new Container(
            height: 50.0,
            child: new TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              tabs: [
                Tab(child: Text("Featured", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ),
                Tab(child: Text("Business", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ),
                Tab(child: Text("Technology", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ),
                Tab(child: Text("Entertainment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ),
                Tab(child: Text("Sports", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ),
                Tab(child: Text("Health", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ),
                Tab(child: Text("Science", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Featured(),
            Business(),
            Technology(),
            Entertainment(),
            Sports(),
            Health(),
            Science(),
          ],
        ),
      ),
    ),
    );
  }
}
