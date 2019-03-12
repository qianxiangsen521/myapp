import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';
void main() => runApp(MyApp());


//StatelessWidget 是不可变的
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationWidget(),
    );
  }
}
