import 'package:chongwu/pages/MemoriesOverviewPage.dart';
import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/values/MyIcons.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:chongwu/widget/RadiusLinearProcess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
  MinePageState createState() => MinePageState();
}

class MinePageState extends State<MinePage>{

  String username = "丽香";
  int days = 25;
  String avatarUrl = "res/images/dog.png";
  List<String> memory = [
    "res/images/111.jpg",
    "res/images/background.jpg",
    "##locked##",
    "res/images/111.jpg",
    "res/images/background.jpg",
    "##locked##",
    "##none##"
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
    DateTime now = new DateTime.now();
    int minutes = now.hour*60+now.minute;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.orange,
        leading: BackButton(color: Colors.white,),
        title: Text(MyTexts.mine,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        color: MyColors.lightGrey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                //第一个卡片,欢迎卡片
                Card(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //头像
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(color: MyColors.deepOrange,width: 3)
                        ),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                            child: Image(
                              image: AssetImage(avatarUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                text: "早上好，",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: username,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: MyColors.deepOrange
                                    )
                                  )
                                ]
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "你已经和皮皮一起度过了" + days.toString() + "天",
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            )
                          ],
                        )
                      )
                    ],
                  )
                ),
                //第二个卡片，好友卡片
                Card(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("好友"),
                            Icon(Icons.person_add_alt,color: MyColors.deepOrange,),
                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: SizedBox(
                          width: width-40,
                          height: width/3.5,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(45),
                                          border: Border.all(color: MyColors.deepOrange,width: 3)
                                      ),
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(45)),
                                          child: Image(
                                            image: AssetImage(avatarUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("小王")
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(45),
                                          border: Border.all(color: MyColors.deepOrange,width: 3)
                                      ),
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(45)),
                                          child: Image(
                                            image: AssetImage(avatarUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("小王")
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(45),
                                          border: Border.all(color: MyColors.deepOrange,width: 3)
                                      ),
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(45)),
                                          child: Image(
                                            image: AssetImage(avatarUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("小王")
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(45),
                                          border: Border.all(color: MyColors.deepOrange,width: 3)
                                      ),
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(45)),
                                          child: Image(
                                            image: AssetImage(avatarUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("小王")
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(45),
                                          border: Border.all(color: MyColors.deepOrange,width: 3)
                                      ),
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(45)),
                                          child: Image(
                                            image: AssetImage(avatarUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("小王")
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(45),
                                          border: Border.all(color: MyColors.deepOrange,width: 3)
                                      ),
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(45)),
                                          child: Image(
                                            image: AssetImage(avatarUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("小王")
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(45),
                                          border: Border.all(color: MyColors.deepOrange,width: 3)
                                      ),
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(45)),
                                          child: Image(
                                            image: AssetImage(avatarUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("小王")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                    ],
                  )
                ),
                //第三个卡片，一天时间
                Card(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                        child: Text("今天"),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                        child: Column(
                          children: <Widget>[
                            RadiusLinearProcess(
                              value: minutes/1440,
                              height: 20,
                              width: width-40,
                              frColor: MyColors.orange,
                              bgColor: Colors.white,
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(child: Text("0"),flex: 1,),
                                Expanded(child: Text("2"),flex: 1,),
                                Expanded(child: Text("4"),flex: 1,),
                                Expanded(child: Text("6"),flex: 1,),
                                Expanded(child: Text("8"),flex: 1,),
                                Expanded(child: Text("10"),flex: 1,),
                                Expanded(child: Text("12"),flex: 1,),
                                Expanded(child: Text("14"),flex: 1,),
                                Expanded(child: Text("16"),flex: 1,),
                                Expanded(child: Text("18"),flex: 1,),
                                Expanded(child: Text("20"),flex: 1,),
                                Expanded(child: Text("22"),flex: 1,),
                                Expanded(child: Text("24"),flex: 1,),
                                // Text("2"),
                                // Text("4"),
                                // Text("6"),
                                // Text("8"),
                                // Text("10"),
                                // Text("12"),
                                // Text("14"),
                                // Text("16"),
                                // Text("18"),
                                // Text("20"),
                                // Text("22"),
                                // Text("24"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}