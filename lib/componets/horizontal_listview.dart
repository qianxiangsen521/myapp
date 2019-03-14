import 'package:flutter/material.dart';
import 'package:myapp/json/RecommendInfo.dart';

class HorizontalList extends StatelessWidget {
  List<dynamic> recommendInfo;
  HorizontalList({this.recommendInfo});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendInfo != null ? RecommendInfo.fromJson(recommendInfo[0]).contents.length : 0,
        itemBuilder: (BuildContext context, int index) {
          return Category(
//            image: "assets/tshirt.png",
            image: RecommendInfo.fromJson(recommendInfo[0]).contents[index].img_url,
            title: RecommendInfo.fromJson(recommendInfo[0]).contents[index].name,
          );
        },
      ),
    );
  }
}
//Category(
//image_location: "assets/tshirt.png",
//image_caption: "shirt",
//),

class Category extends StatelessWidget {
  final String image;
  final String title;
  Category({this.image, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.network(
              image,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(title),
            ),
          ),
        ),
      ),
    );
  }
}
