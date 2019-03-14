import 'package:flutter/material.dart';

import 'package:myapp/pages/product_details.dart';
import 'package:myapp/json/RecommendInfo.dart';
class Products extends StatefulWidget {

 final List<dynamic> recommendInfo;
 Products({this.recommendInfo});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  List<dynamic> contents = [];
//  var products_list = [
//    {
//      "name": "Blazer",
//      "pictuice": "assets/tshirt.png",
//      "old_price": 120,
//      "price": 85,
//    },
//    {
//      "name": "Blazer",
//      "pictuice": "assets/tshirt.png",
//      "old_price": 120,
//      "price": 85,
//    }
//  ];
  @override
  Widget build(BuildContext context) {
    if(widget.recommendInfo != null){
      for(int i = 0; i < widget.recommendInfo.length; i++){
        if(RecommendInfo.fromJson(widget.recommendInfo[i]).index_type == 2){
          contents.addAll(RecommendInfo.fromJson(widget.recommendInfo[i]).contents);
        }
      }
    }
    return GridView.builder(
        itemCount: contents != null ? contents.length : 0,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: contents[index].name,
            prod_pricture: contents[index].img_url,
            prod_old_price: contents[index].name,
            prod_price: contents[index].name,
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;
  Single_prod(
      {this.prod_name,
      this.prod_pricture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap:() => Navigator.of(context).push(new
              MaterialPageRoute(builder: (context)=>new ProductDetails())),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
//                      title: Text(
//                        "\$$prod_price",
//                        style: TextStyle(
//                            color: Colors.red, fontWeight: FontWeight.w800),
//                      ),
//                      subtitle: Text(
//                        "\$$prod_old_price",
//                        style: TextStyle(
//                          color: Colors.blue,
//                          fontWeight: FontWeight.w800,
//                          decoration: TextDecoration.lineThrough,
//                        ),
//                      ),
                    ),
                  ),
                  child: Image.network(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
