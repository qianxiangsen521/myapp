import 'package:flutter/material.dart';

import 'package:myapp/new_route.dart';
class EmailSceen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("email"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text("open new route"),
            textColor: Colors.blue,
            onPressed: () {
              //导航到新路由
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new HttpTestRoute();
              }));
            },
          ),
        ],

      ),

    );
  }
}
