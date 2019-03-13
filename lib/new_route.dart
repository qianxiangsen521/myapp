import 'dart:convert';
import 'dart:io';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'colors.dart';
import 'models/home_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'models/Main.dart';
import 'json/Banner.dart';
import 'json/RecommendInfo.dart';

class HttpTestRoute extends StatefulWidget {
  @override
  _HttpTestRouteState createState() => new _HttpTestRouteState();
}


class _HttpTestRouteState extends State<HttpTestRoute> {
  List<dynamic> jsonresponse;
  List<dynamic> recommendInfo;
  @override
  void initState() {
    //HOME_HEADER_RUL
    http.post(HOME_HEADER_RUL, body: {
      "sn": "7CB1723CB1A128BBCEB902AD3E35FCEE",
      "project_id": "01",
      "app_id": "01",
      "guid": "a3fc42fd-484f-4fdb-a49d-b6ce0f9886fb",
      "hash": "b7b0582258f394b674e0be283b13263e",
      "platform": "0"
    }).then((response) {
      setState(() {
        jsonresponse = json.decode(response.body);
        for (int i = 0; i < jsonresponse.length; i++) {
          print('Response name:${BannerInfo.fromJson(jsonresponse[i]).name}');
        }
        BannerInfo bannerInfo = BannerInfo.fromJson(jsonresponse[0]);
        print("Response name: ${bannerInfo.name}");

        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      });
    });

    //HOME_URL
    http.post(HOME_URL, body: {
      "sn": "7CB1723CB1A128BBCEB902AD3E35FCEE",
      "project_id": "01",
      "app_id": "01",
      "guid": "a3fc42fd-484f-4fdb-a49d-b6ce0f9886fb",
      "hash": "b7b0582258f394b674e0be283b13263e",
      "platform": "0"
    }).then((response) {
      setState(() {
        recommendInfo = json.decode(response.body);
        for (int i = 0; i < recommendInfo.length; i++) {
          print(
              '"Response name1111: ${RecommendInfo.fromJson(recommendInfo[i]).title}');
        }
        print("Response status11111: ${response.statusCode}");
        print("Response body11111: ${response.body}");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Contacts'),
        ),
//    body: new BannerMainWidget(),
        body:
    Container(
     child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              jsonresponse: jsonresponse,
              minExtent: 150.0,
              maxExtent: 250.0,

            ),
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: _edgeInsetsForIndex(index),
                  child: new Text(
                    RecommendInfo.fromJson(recommendInfo[index]).title,
                  ),
                );
              },
              childCount: recommendInfo != null ? recommendInfo.length : 0,
            ),
          ),
        ],

      ),
    ),

    );

  }
  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
    } else {
      return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
    }
  }
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Contacts'),
////          actions: [
////            new IconButton(icon: new Icon(Icons.add_circle),
////                onPressed: getCustData
////            ),
////          ],
//        ),
//        //body:
//        body: new Column(
//            children: [
//              new Row(
//                  children: [
//                    new Expanded(child: new Text('', style: new TextStyle(
//                      height: 3.0,
//                      fontSize: 15.2,
//                      fontWeight: FontWeight.bold,))),
//                    new Expanded(child: new Text('First Name',
//                        style: new TextStyle(height: 3.0,
//                          fontSize: 15.2,
//                          fontWeight: FontWeight.bold,))),
//                    new Expanded(child: new Text('Last Name',
//                        style: new TextStyle(height: 3.0,
//                          fontSize: 15.2,
//                          fontWeight: FontWeight.bold,))),
//                    new Expanded(child: new Text('City', style: new TextStyle(
//                      height: 3.0,
//                      fontSize: 15.2,
//                      fontWeight: FontWeight.bold,))),
//                    new Expanded(child: new Text('Customer Id',
//                        style: new TextStyle(height: 3.0,
//                          fontSize: 15.2,
//                          fontWeight: FontWeight.bold,))),
//                    new Expanded(child: new Text('', style: new TextStyle(
//                      height: 3.0,
//                      fontSize: 15.2,
//                      fontWeight: FontWeight.bold,))),
//                  ]
//              ),
//
//
//              new Expanded(child: Container(
//                child: ListView.builder(
//
//                  itemCount: user.bannerInfo == null ? 0 : user.bannerInfo.length,
//                  itemBuilder: (BuildContext context, int index) {
//                    return new InkWell(
////                      onTap: () {
////                        Navigator.push(
////                          context,
////                          new MaterialPageRoute(
////                              builder: (context) =>
////                              new APIDetailView(data[index])),
////                        );
////                      },
//
//                      child: new ListTile( //return new ListTile(
//                          onTap: null,
//                          leading: new CircleAvatar(
//                            backgroundColor: Colors.blue,
//                            child: new Text(user.bannerInfo[index].titleText),
//                          ),
//                          title: new Row(
//                              children: <Widget>[
//                                new Expanded(
//                                    child: new Text(user.bannerInfo[index].titleText)),
//                                new Expanded(
//                                    child: new Text(user.bannerInfo[index].titleText)),
//                                new Expanded(
//                                    child: new Text(user.bannerInfo[index].titleText)),
//                                new Expanded(child: new Text(
//                                    user.bannerInfo[index].titleText`)),
//                              ]
//                          )
//                      ),
//
//                    );
//                  }, //itemBuilder
//
//                ),
//              ),
//              ),
//            ]
//        )
//    );
//  }

  void httpHome() {
    //创建一个HttpClient
//                      HttpClient httpClient = new HttpClient();
//                      //打开Http连接
//                      HttpClientRequest request = await httpClient.getUrl(
//                          Uri.parse("https://www.baidu.com"));
//                      //使用iPhone的UA
//                      request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
//                      //等待连接服务器（会将请求信息发送给服务器）
//                      HttpClientResponse response = await request.close();
//                      //读取响应内容
//                      _text = await response.transform(utf8.decoder).join();
//                      //输出响应头
//                      print(response.headers);
//
//                      //关闭client后，通过该client发起的所有请求都会中止。
//                      httpClient.close();
  }
}
class HeroHeader implements SliverPersistentHeaderDelegate {

  HeroHeader({
    this.jsonresponse,
    this.minExtent,
    this.maxExtent,
  });
  List<dynamic> jsonresponse;
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Swiper(
            itemCount: jsonresponse != null ? jsonresponse.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                BannerInfo.fromJson(jsonresponse[index]).img_url,
                fit: BoxFit.fill,
              );
            },
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                builder: DotSwiperPaginationBuilder(
                    color: Colors.black54, activeColor: Colors.white)),
            controller: SwiperController(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) => print('点击了第$index'),
          ),
        ),

      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return null;
  }

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

}