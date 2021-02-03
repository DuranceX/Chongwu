import 'package:chongwu/values/MyIcons.dart';
import 'package:chongwu/values/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
  MinePageState createState() => MinePageState();
}

class MinePageState extends State<MinePage>{

  List<String> memory = [
    "res/images/111.jpg",
    "res/images/background.jpg",
    "##locked##",
    "res/images/111.jpg",
    "res/images/background.jpg",
    "##locked##"
  ];

  PageController _pageController;
  var _currPageValue = 0.0;

  //缩放系数
  double _scaleFactor = 0.8;

  double _height = 220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        toolbarHeight: 40,
        title: Text(Texts.mine,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 150,
                    maxHeight: 150,
                    minWidth:  150,
                    maxWidth:  150,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Icon(MyIcons.person,color: Colors.white,size: 100,),
                      //child: Image(image: AssetImage("res/images/111.jpg"),fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text("用户名"),
                      Text("注册时间"),
                      Text("宠物名称"),
                    ],
                  )
                ),
              ),
              Divider(thickness: 1,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 200,
                      maxHeight: 200
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(
                      child: Text("学习时长显示区域"),
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 200,
                      maxHeight: 200
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(
                      child: Text("标签计时显示区域"),
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 200,
                    maxHeight: 200,
                    minWidth: (width.ceil()-40)/1,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Stack(
                      children: <Widget>[
                        PageView.builder(
                          controller: _pageController,
                          itemBuilder: (context,index){
                            Matrix4 matrix4 = Matrix4.identity();
                            if (index == _currPageValue.floor()) {
                              //当前的item
                              var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
                              var currTrans = _height * (1 - currScale) / 2;

                              matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
                                ..setTranslationRaw(0.0, currTrans, 0.0);
                            } else if (index == _currPageValue.floor() + 1) {
                              //右边的item
                              var currScale =
                                  _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
                              var currTrans = _height * (1 - currScale) / 2;

                              matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
                                ..setTranslationRaw(0.0, currTrans, 0.0);
                            } else if (index == _currPageValue.floor() - 1) {
                              //左边
                              var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
                              var currTrans = _height * (1 - currScale) / 2;

                              matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
                                ..setTranslationRaw(0.0, currTrans, 0.0);
                            } else {
                              //其他，不在屏幕显示的item
                              matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
                                ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
                            }

                            if(memory[index] != "##locked##"){
                              return Transform(
                                transform: matrix4,
                                child: Container(
                                  //margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                  child: SizedBox(
                                    height: 160,
                                    width: (width.ceil()-40)/3,
                                    child: Image(image: AssetImage(memory[index % (memory.length-1)]),fit: BoxFit.cover,),
                                  ),
                                ),
                              );
                            }
                            else{
                              return Transform(
                                  transform: matrix4,
                                  child: Container(
                                    color: Colors.blue,
                                    child: Center(
                                      child: Text("Locked",style: TextStyle(fontSize: 45,color: Colors.white),),
                                    ),
                                  ),
                              );
                            }
                          },
                          itemCount: memory.length,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}