import 'package:flutter/material.dart';

import 'BannerViewPage.dart';
import 'FullBannerPage.dart';

/// Created by yangxiaowei
class BannerMainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('BannerMain'),
      ),

      body: new Center(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('to listview banner'),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new BannerViewPage()));
              },
            ),
            new ListTile(
              title: new Text('to full banner'),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new FullBannerPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
