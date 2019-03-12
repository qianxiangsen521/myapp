import 'package:flutter/material.dart';
import 'banner_view.dart';

import 'Pair.dart';
import 'BannerItemFactory.dart';

class BannerViewPage extends StatefulWidget {
  @override
  _BannerViewPageState createState() => new _BannerViewPageState();
}

class _BannerViewPageState extends State<BannerViewPage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BannerView List'),
      ),
      body: new Container(
        child: this._listView(),
      ),
    );
  }

  Widget _listView() {

    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index == 0) {

          return new Container(
            height: 180.0,
            child: this._bannerView(),
          );
        }else if(index == 2) {

          return new Container(
            alignment: Alignment.center,
            height: 200.0,
            child: this._bannerView0(),
          );
        }

        return new ListTile(
          title: new Text('data $index'),
        );
      },
    );
  }

  BannerView _bannerView0() {

    List<Pair<String, Color>> param = [
      Pair.create('1', Colors.red[500]),
      Pair.create('2', Colors.green[500]),
      Pair.create('3', Colors.blue[500]),
      Pair.create('4', Colors.yellow[500]),
      Pair.create('5', Colors.purple[500]),
    ];

    return new BannerView(
      BannerItemFactory.banners(param),
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
      indicatorMargin: 10.0,
      indicatorNormal: new Container(
        width: 5.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: Colors.green,
          shape: BoxShape.rectangle,
        ),
      ),
      indicatorSelected: new Container(
        width: 15.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(
            new Radius.circular(5.0),
          ),
        ),
      ),
      indicatorBuilder: (context, indicator) {
        Widget cc = new Container(
          padding: new EdgeInsets.symmetric(horizontal: 20.0,),
          height: 44.0,
          width: double.infinity,
          color: Colors.grey[300],
          child: indicator,
        );
        return new Opacity(
          opacity: 0.5,
          child: cc,
        );
      },
    );
  }
}