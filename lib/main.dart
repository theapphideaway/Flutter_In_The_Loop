import 'package:flutter/material.dart';

import 'BottomNavigation.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: BottomNavigation(),
    );
  }
}

