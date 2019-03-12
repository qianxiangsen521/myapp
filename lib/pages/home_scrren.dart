import 'package:flutter/material.dart';
import 'package:myapp/customscroll.dart';

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}

class HomeSceen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:

          //ListView是最常用的可滚动widget，它可以沿一个方向线性排布所有子widget。我们看看ListView的默认构造函数定义：
          //ListView({
          //  ...
          //  //可滚动widget公共参数
          //  Axis scrollDirection = Axis.vertical,
          //  bool reverse = false,
          //  ScrollController controller,
          //  bool primary,
          //  ScrollPhysics physics,
          //  EdgeInsetsGeometry padding,
          //
          //  //ListView各个构造函数的共同参数
          //  double itemExtent,
          //  bool shrinkWrap = false,
          //  bool addAutomaticKeepAlives = true,
          //  bool addRepaintBoundaries = true,
          //  double cacheExtent,
          //
          //  //子widget列表
          //  List<Widget> children = const <Widget>[],
          //})

          //itemExtent：该参数如果不为null，则会强制children的"长度"为itemExtent的值；这里的"长度"是指滚动方向上子widget的长度，即如果滚动方向是垂直方向，则itemExtent代表子widget的高度，如果滚动方向为水平方向，则itemExtent代表子widget的长度。在ListView中，指定itemExtent比让子widget自己决定自身长度会更高效，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，而不是总是动态去计算，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
          //shrinkWrap：该属性表示是否根据子widget的总长度来设置ListView的长度，默认值为false 。默认情况下，ListView的会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
          //addAutomaticKeepAlives：该属性表示是否将列表项（子widget）包裹在AutomaticKeepAlive widget中；典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，在该列表项滑出视口时该列表项不会被GC，它会使用KeepAliveNotification来保存其状态。如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
          //addRepaintBoundaries：该属性表示是否将列表项（子widget）包裹在RepaintBoundary中。当可滚动widget滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效。和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
//      ListView(
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(20.0),
//        children: <Widget>[
//          const Text('I\'m dedicating every day to you'),
//          const Text('Domestic life was never quite my style'),
//          const Text('When you smile, you knock me out, I fall apart'),
//          const Text('And I thought I was so smart'),
//        ],
//      ),

//ListView.builder

          //itemBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。当列表滚动到具体的index位置时，会调用该构建器构建列表项。
          //itemCount：列表项的数量，如果为null，则为无限列表。

//        ListView.builder(
//            itemCount: 100,
//            itemExtent: 50.0, //强制高度为50.0
//            itemBuilder: (BuildContext context, int index) {
//              return ListTile(title: Text("$index"));
//            }
//        ),
//

//ListView.separated

//        ListView3(),

          //ListView.separated可以生成列表项之间的分割器，它除了比ListView.builder多了一个separatorBuilder参数，该参数是一个分割器生成器。下面我们看一个例子：奇数行添加一条蓝色下划线，偶数行添加一条绿色下划线。

          //实例：无限加载列表
          //假设我们要从数据源异步分批拉取一些数据，然后用ListView显示，当我们滑动到列表末尾时，判断是否需要再去拉取数据，如果是，则去拉取，拉取过程中在表尾显示一个loading，拉取成功后将数据插入列表；如果不需要再去拉取，则在表尾提示"没有更多"。代码如下：

          //GridView可以构建一个二维网格列表，其默认构造函数定义如下：

          //GridView({
          //  Axis scrollDirection = Axis.vertical,
          //  bool reverse = false,
          //  ScrollController controller,
          //  bool primary,
          //  ScrollPhysics physics,
          //  bool shrinkWrap = false,
          //  EdgeInsetsGeometry padding,
          //  @required SliverGridDelegate gridDelegate, //控制子widget layout的委托
          //  bool addAutomaticKeepAlives = true,
          //  bool addRepaintBoundaries = true,
          //  double cacheExtent,
          //  List<Widget> children = const <Widget>[],
          //})

          //crossAxisCount：纵轴子元素的数量。此属性值确定后子元素在纵轴的长度就确定了,即ViewPort纵轴长度/crossAxisCount。
          //mainAxisSpacing：主轴方向的间距。
          //crossAxisSpacing：纵轴方向子元素的间距。
          //childAspectRatio：子元素在纵轴长度和主轴长度的比例。由于crossAxisCount指定后子元素纵轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。

//        GridView(
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 3, //纵轴三个子widget
//                childAspectRatio: 1.0 //宽高比为1时，子widget
//            ),
//            children:<Widget>[
//              Icon(Icons.ac_unit),
//              Icon(Icons.airport_shuttle),
//              Icon(Icons.all_inclusive),
//              Icon(Icons.beach_access),
//              Icon(Icons.cake),
//              Icon(Icons.free_breakfast)
//            ]
//        ),

          ///CustomScrollView
          ///CustomScrollView是可以使用sliver来自定义滚动模型（效果）的widget。它可以包含多种滚动模型，举个例子，假设有一个页面，顶部需要一个GridView，底部需要一个ListView，而要求整个页面的滑动效果是统一的，即它们看起来是一个整体，如果使用GridView+ListView来实现的话，就不能保证一致的滑动效果，因为它们的滚动效果是分离的，所以这时就需要一个"胶水"，把这些彼此独立的可滚动widget（Sliver）"粘"起来，而CustomScrollView的功能就相当于“胶水”。
          CustomScrollViewTestRoute(),
//SingleChildScrollView
//SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子Widget。定义如下：

      //SingleChildScrollView({
      //  this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
      //  this.reverse = false,
      //  this.padding,
      //  bool primary,
      //  this.physics,
      //  this.controller,
      //  this.child,
      //})
//everse：该属性API文档解释是：是否按照阅读方向相反的方向滑动，如：scrollDirection值为Axis.horizontal，如果阅读方向是从左到右(取决于语言环境，阿拉伯语就是从右到左)，reverse为true时，那么滑动方向就是从右往左。其实此属性本质上是决定可滚动widget的初始滚动位置是在“头”还是“尾”，取false时，初始滚动位置在“头”，反之则在“尾”，读者可以自己试验。
//primary：指是否使用widget树中默认的PrimaryScrollController；当滑动方向为垂直方向（scrollDirection值为Axis.vertical）并且controller没有指定时，primary默认为true.
//          Scrollbar(
//        child: SingleChildScrollView(
//          padding: EdgeInsets.all(16.0),
//          child: Center(
//            child: Column(
//              //动态创建一个List<Widget>
//              children: str.split("")
//              //每一个字母都用一个Text显示,字体为原来的两倍
//                  .map((c) => Text(c, textScaleFactor: 2.0,))
//                  .toList(),
//            ),
//          ),
//        ),
//      ),

      //Container是我们要介绍的最后一个容器类widget，它本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget。所以我们只需通过一个Container可以实现同时需要装饰、变换、限制的场景。下面是Container的定义：
//Container({
//  this.alignment,
//  this.padding, //容器内补白，属于decoration的装饰范围
//  Color color, // 背景色
//  Decoration decoration, // 背景装饰
//  Decoration foregroundDecoration, //前景装饰
//  double width,//容器的宽度
//  double height, //容器的高度
//  BoxConstraints constraints, //容器大小的限制条件
//  this.margin,//容器外补白，不属于decoration的装饰范围
//  this.transform, //变换
//  this.child,
//})
//        Container(
//          margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外补白
//          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
//          decoration: BoxDecoration(//背景装饰
//              gradient: RadialGradient( //背景径向渐变
//                  colors: [Colors.red, Colors.orange],
//                  center: Alignment.topLeft,
//                  radius: .98
//              ),
//              boxShadow: [ //卡片阴影
//                BoxShadow(
//                    color: Colors.black54,
//                    offset: Offset(2.0, 2.0),
//                    blurRadius: 4.0
//                )
//              ]
//          ),
//          transform: Matrix4.rotationZ(.2), //卡片倾斜变换
//          alignment: Alignment.center, //卡片内文字居中
//          child: Text( //卡片文字
//            "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
//          ),
//        ),

//DecoratedBox可以在其子widget绘制前(或后)绘制一个装饰Decoration（如背景、边框、渐变等）。DecoratedBox定义如下：

      //BoxDecoration({
      //  Color color, //颜色
      //  DecorationImage image,//图片
      //  BoxBorder border, //边框
      //  BorderRadiusGeometry borderRadius, //圆角
      //  List<BoxShadow> boxShadow, //阴影,可以指定多个
      //  Gradient gradient, //渐变
      //  BlendMode backgroundBlendMode, //背景混合模式
      //  BoxShape shape = BoxShape.rectangle, //形状
      //})
//
//        DecoratedBox(
//            decoration: BoxDecoration(
//                gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
//                borderRadius: BorderRadius.circular(3.0), //3像素圆角
//                boxShadow: [ //阴影
//                  BoxShadow(
//                      color:Colors.black54,
//                      offset: Offset(2.0,2.0),
//                      blurRadius: 4.0
//                  )
//                ]
//            ),
//            child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
//              child: Text("Login", style: TextStyle(color: Colors.white),),
//            )
//        ),

//ConstrainedBox用于对齐子widget添加额外的约束。例如，如果你想让子widget的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子widget的约束。
      //ConstrainedBox和SizedBox
//      ConstrainedBox(
//        constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
//
//        child: redBox,
//      ),
//可以看到，我们虽然将Container的高度设置为5像素，但是最终却是50像素，这正是ConstrainedBox的最小高度限制生效了。如果将Container的高度设置为80像素，那么最终红色区域的高度也会是80像素，因为在此示例中，ConstrainedBox只限制了最小高度，并未限制最大高度。

//SizedBox
//SizedBox用于给子widget指定固定的

//        Padding(padding: EdgeInsets.all(16.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(left: 8.0),
//                  child: Text("Hello world"),
//                ),
//                Padding(
//                  //上下各添加8像素补白
//                  padding: const EdgeInsets.symmetric(vertical: 8.0),
//                  child: Text("I am Jack"),
//                ),
//                Padding(
//                  // 分别指定四个方向的补白
//                  padding: const EdgeInsets.fromLTRB(20.0,.0,20.0,20.0),
//                  child: Text("Your friend"),
//                )
//
//              ],
//            ),
//        ),
      //Padding可以给其子节点添加补白（填充），我们在前面很多示例中都已经使用过它了，现在来看看它的定义：
      //fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的补白。
      //all(double value) : 所有方向均使用相同数值的补白。
      //only({left, top, right ,bottom })：可以设置具体某个方向的补白(可以同时指定多个方向)。
      //symmetric({ vertical, horizontal })：用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right。

      //层叠布局
      //层叠布局和Web中的绝对定位、Android中的Frame布局是相似的，
      // 子widget可以根据到父容器四个角的位置来确定本身的位置。
      // 绝对定位允许子widget堆叠（按照代码中声明的顺序）。
      // Flutter中使用Stack和Positioned来实现绝对定位，Stack允许子widget堆叠，
      // 而Positioned可以给子widget定位（根据Stack的四个角）

//      ConstrainedBox(
//        constraints: BoxConstraints.expand(),
//        child: Stack(
//          alignment: Alignment.center,
//          children: <Widget>[
//            Container(
//              child: Text("Hello word",style: TextStyle(color: Colors.white)),
//              color: Colors.red,
//            ),
//            Positioned(
//              left: 18.0,
//              child: Text("I am Jack"),
//            ),
//            Positioned(
//              top: 18.0,
//              child: Text("Your friend"),
//            )
//          ],
//        ),
//      ),

      //流式布局
      //在介绍Row和Colum时，如果子widget超出屏幕范围，则会报溢出错误，如：
      //可以看到，右边溢出部分报错。这是因为Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为流式布局。Flutter中通过Wrap和Flow来支持流式布局，将上例中的Row换成Wrap后溢出部分则会自动折行。下面是Wrap的定义:
//        Wrap(
//          spacing: 8.0, // 主轴(水平)方向间距
//          runSpacing: 4.0, // 纵轴（垂直）方向间距
//          alignment: WrapAlignment.center,
//          children: <Widget>[
//            new Chip(
//              avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("a"),),
//              label: new Text("Hamilton"),
//            ),
//            new Chip(
//              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
//              label: new Text('Lafayette'),
//            ),
//            new Chip(
//              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
//              label: new Text('Mulligan'),
//            ),
//            new Chip(
//              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
//              label: new Text('Laurens'),
//            ),
//          ],
//        ),

      //弹性布局
      //弹性布局允许子widget按照一定比例来分配父容器空间，
      // 弹性布局的概念在其UI系统中也都存在，如H5中的弹性盒子布局，
      // Android中的FlexboxLayout。Flutter中的弹性布局主要通过Flex和Expanded来配合实现

//      Column(
//        children: <Widget>[
//          //Flex的两个子widget按1：2来占据水平空间
//          Flex(
//            direction: Axis.horizontal,
//            children: <Widget>[
//              Expanded(
//                flex: 1,
//                child: Container(
//                  height: 30.0,
//                  color: Colors.red,
//                ),
//              ),
//              Expanded(
//                flex: 2,
//                child: Container(
//                  height: 30.0,
//                  color: Colors.green,
//                ),
//              ),
//            ],
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 20.0),
//            child: SizedBox(
//              height: 100.0,
//              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
//              child: Flex(
//                direction: Axis.vertical,
//                children: <Widget>[
//                  Expanded(
//                    flex: 2,
//                    child: Container(
//                      height: 30.0,
//                      color: Colors.red,
//                    ),
//                  ),
//                  Spacer(
//                    flex: 1,
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Container(
//                      height: 30.0,
//                      color: Colors.green,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ],
//      ),

//      Container(
//        color: Colors.green,
//        child: Padding(
//          padding: const EdgeInsets.all(16.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
//            children: <Widget>[
//              Container(
//                color: Colors.red,
//                child: Column(
//                  mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度
//                  children: <Widget>[
//                    Text("hello world "),
//                    Text("I am Jack "),
//                  ],
//                ),
//              )
//            ],
//          ),
//        ),
//      ),

      //线性布局Row和Column
      //所谓线性布局，即指沿水平或垂直方向排布子Widget。
      // Flutter中通过Row和Column来实现线性布局，
      // 类似于Android中的LinearLayout控件。R
      // ow和Column都继承自Flex，我们将在弹性布局一节中详细介绍Flex。

//        Column(
//          //测试Row对齐方式，排除Column默认居中对齐的干扰
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(" hello world "),
//                Text(" I am Jack "),
//              ],
//            ),
//            Row(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(" hello world "),
//                Text(" I am Jack "),
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              textDirection: TextDirection.rtl,
//              children: <Widget>[
//                Text(" hello world "),
//                Text(" I am Jack "),
//              ],
//            ),
//            Row(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              verticalDirection: VerticalDirection.up,
//              children: <Widget>[
//                Text(" hello world ", style: TextStyle(fontSize: 30.0),),
//                Text(" I am Jack "),
//              ],
//            ),
//          ],
//        ),
    );
  }
}
//Column可以在垂直方向排列其子widget。参数和Row一样，不同的是布局方向为垂直，主轴纵轴正好相反，读者可类比Row来理解，在此不再赘述。


//路由管理
//路由(Route)在移动开发中通常指页面（Page），这跟web开发中单页应用的Route概念意义是相同的，Route在Android中通常指一个Activity，在iOS中指一个ViewController。所谓路由管理，就是管理页面之间如何跳转，通常也可被称为导航管理。这和原生开发类似，无论是Android还是iOS，导航管理都会维护一个路由栈，路由入栈(push)操作对应打开一个新页面，路由出栈(pop)操作对应页面关闭操作，而路由管理主要是指如何来管理路由栈。


//如果您从未打算更改一个变量，那么使用 final 或 const
//Dynamic和Object 与 var功能相似，都会在赋值时自动进行类型推断，不同在于，赋值后可以改变其类型，
//var 它可以接收任何类型的变量，但最大的不同是Dart中var变量一旦赋值，类型便会确定，则不能再改变其类型，如：

