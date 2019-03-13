import 'package:flutter/material.dart';
import 'package:myapp/json/Banner.dart';
import 'package:myapp/json/RecommendInfo.dart';
import 'package:myapp/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/componets/horizontal_listview.dart';

class TestSceen extends StatefulWidget {
  @override
  _TestTestRouteState createState() => new _TestTestRouteState();
}

class _TestTestRouteState extends State<TestSceen> {
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
        print("Response status11111: ${RecommendInfo.fromJson(recommendInfo[0]).contents[0].img_url}");
        print("Response body11111: ${response.body}");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: new ListView(
        children: <Widget>[
          //image banner
          image_carousel(jsonresponse),

          //padding widget
//          new Padding(
//            padding: const EdgeInsets.all(2.0),
//            child: new Text('中央台'),
//          ),

          //Horizontal list view begins here
          HorizontalList(recommendInfo: recommendInfo),


        ],
      ),
    );
  }

  Widget image_carousel(List<dynamic> jsonresponse) {
    return Container(
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
    );
  }
}
