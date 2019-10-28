import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_in_the_loop/Dashboard.dart';

import 'SearchView.dart';

class BottomNavigation extends StatefulWidget{
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation>{

  int _currentIndex = 0;
  final List<Widget> _children = [
    Dashboard(),
    SearchView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Headlines'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Search'),

          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}