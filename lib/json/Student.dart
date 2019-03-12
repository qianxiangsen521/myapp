

/*{
"id":"487349",
"name":"Pooja Bhaumik",
"score" : 1000
}*/
class Student{

  String studentId;

  String studentTitle;

  int studentScores;


  Student({
    this.studentId,
    this.studentTitle,
    this.studentScores
  });

  //Perfect！
//是这样吗？ 因为 json 映射和这个 PODO 文件之间没有映射。甚至实体名称也不匹配。
//我知道我知道。 我们还没有完成。我们必须将这些类成员映射到 json 对象。为此，我们需要创建一个 factory 方法。根据 Dart 文档，我们在实现一个构造函数时使用 factory 关键字时，这个构造函数不会总是创建其类的新实例，而这正是我们现在所需要的。

//我们创建了一个叫做 Student.fromJson 的工厂方法，用来简单地反序列化你的 json
 factory Student.fromJson(Map<String, dynamic> parsedJson){

    return Student(
      studentId: parsedJson['id'],
      studentTitle: parsedJson['name'],
      studentScores: parsedJson['scores']
    );
  }

}