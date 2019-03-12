import 'banner_view.dart';
import 'package:flutter/material.dart';

import 'Pair.dart';
import 'BannerItemFactory.dart';

/// Created by yangxiaowei
class FullBannerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BannerView Full'),
      ),
      body: new Container(
        child: this._bannerView(),
      ),
    );
  }

  BannerView _bannerView() {

    var pre = 'https://raw.githubusercontent.com/yangxiaoweihn/Assets/master';
    List<Pair<String, Color>> param = [
      Pair.create('$pre/cars/car_0.jpg', Colors.red[100]),
      Pair.create('$pre/cartoons/ct_0.jpg', Colors.green[100]),
      Pair.create('$pre/pets/cat_1.jpg', Colors.blue[100]),
      Pair.create('$pre/scenery/s_1.jpg', Colors.yellow[100]),
      Pair.create('$pre/cartoons/ct_1.jpg', Colors.red[100]),
    ];

    return new BannerView(
      BannerItemFactory.banners(param),
      cycleRolling: false,
      autoRolling: false,
      indicatorMargin: 12.0,
      indicatorNormal: this._indicatorItem(Colors.white),
      indicatorSelected: this._indicatorItem(Colors.white, selected: true),
      indicatorBuilder: (context, indicator) {
        return this._indicatorContainer(indicator);
      },
    );
  }

  Widget _indicatorContainer(Widget indicator) {

    var container = new Container(
      height: 64.0,
      child: new Stack(
        children: <Widget>[
          new Opacity(
            opacity: 0.5,
            child: new Container(
              color: Colors.pink[300],
            ),
          ),
          new Align(
            alignment: Alignment.center,
            child: indicator,
          ),
        ],
      ),
    );

    return new Align(
      alignment: Alignment.bottomCenter,
      child: container,
    );
  }

  Widget _indicatorItem(Color color, {bool selected = false}) {

    double size = selected ? 10.0 : 6.0;
    return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.all(
          new Radius.circular(5.0),
        ),
      ),
    );
  }
}