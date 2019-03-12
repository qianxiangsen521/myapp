import 'package:flutter/material.dart';
import 'pages/airplay_scrren.dart';
import 'pages/email_sceen.dart';
import 'pages/home_scrren.dart';
import 'pages/pages_scrren.dart';

//StatefulWidget  每次击都会刷新一次 负责跟用户交互
class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BottomNavigationWidgetState();
}

//代码对齐 右键studio 第九行
class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationWidgetColor = Colors.blue;
  int _currentindex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    //第一次初始化调用


    list
      ..add(HomeSceen())
      ..add(EmailSceen())
      ..add(PagesScrreen())
      ..add(AirPlayScreen());
  //list连续调用
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: list[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _BottomNavigationWidgetColor,
              ),
              title: Text(
                "HOME",
                style: TextStyle(color: _BottomNavigationWidgetColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _BottomNavigationWidgetColor,
              ),
              title: Text(
                "email",
                style: TextStyle(color: _BottomNavigationWidgetColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _BottomNavigationWidgetColor,
              ),
              title: Text(
                "pages",
                style: TextStyle(color: _BottomNavigationWidgetColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _BottomNavigationWidgetColor,
              ),
              title: Text(
                "airplay",
                style: TextStyle(color: _BottomNavigationWidgetColor),
              ))
        ],
        currentIndex: _currentindex,
        onTap: (int index) {
          setState(() {
            _currentindex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
