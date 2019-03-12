/*
{
"shape_name":"rectangle",
"property":{
"width":5.0,
"breadth":10.0
}
}*/


class Property{

  double width;
  double breadth;

  Property({
   this.width,
    this.breadth
});
  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
        width: json['width'],
        breadth: json['breadth']
    );
  }

}