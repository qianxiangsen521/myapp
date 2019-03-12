
import 'package:myapp/json/shape_model.dart';
class Shape{

  String shapeName;
  Property property;

  Shape({
    this.shapeName,
    this.property
  });

  factory Shape.fromJson(Map<String, dynamic> parsedJson){
    return Shape(
        shapeName: parsedJson['shape_name'],
        property : Property.fromJson(parsedJson['property'])
    );
  }

}