import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:chongwu/widget/CustomLineChart.dart';
import 'package:chongwu/widget/RadiusLinearProcess.dart';
import 'package:chongwu/widget/WeeklyBarCharts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MinePage extends StatefulWidget{
  MinePageState createState() => MinePageState();
}

class MinePageState extends State<MinePage> with SingleTickerProviderStateMixin{

  int minutes;
  DateTime now;
  String username = "丽香";
  int days = 25;
  int finishedMission = 5;
  int totalMission = 17;
  String avatarUrl = "res/images/dog.png";
  TabController _monthTabController;

  List<double> dayTime = [
    1, 1.5, 2.6, 3.8, 1.5, 2.3, 2.8
  ];

  //最多5个自定义标签
  List<double> _monthlyAllTime = [1, 1.5, 2, 3.8, 1.5, 2.3, 2.8];
  List<List<double>> _tagTime = [];

  List<String> tags = ["工作","学习", "休闲"];
  List<Tab> tagTabs = [
    Tab(text: "全部",),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    this.now = new DateTime.now();
    this.minutes = now.hour*60+now.minute;

    _tagTime=[
      [1, 1.5, 1, 3.8, 3.5, 2.3, 2.8],
      [1, 0, 2.6, 3.8, 0, 2.3, 2.8],
      [1, 1.5, 0, 3.8, 1.5, 2.3, 2.8],
    ];

    setTagTabs();

    _monthTabController = TabController(length: tagTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.orange,
        leading: BackButton(color: Colors.white,),
        title: Text(MyTexts.mine,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: MyColors.lightGrey,
      body: SingleChildScrollView(
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
                          Font16("好友"),
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
                      child: Font16("今天"),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Column(
                        children: <Widget>[
                          RadiusLinearProcess(
                            value: minutes/1440,
                            height: 20,
                            width: width-80,
                            frColor: MyColors.orange,
                            bgColor: Colors.white,
                          ),
                          SizedBox(height: 15,),
                          //时间轴
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("0")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("2")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("4")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("6")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("8")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("10")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("12")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("14")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("16")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("18")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("20")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("22")],),flex: 1,),
                              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("24")],),flex: 1,),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ),
              Row(
                children: <Widget>[
                  //第四个卡片，完成度
                  Card(
                    margin: EdgeInsets.fromLTRB(10, 5, 5, 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: (width-70)/2,
                      height: (width-70)/2,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Font16("本周 - 完成度")
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                child: CircularPercentIndicator(
                                  radius: 120.0,
                                  lineWidth: 15.0,
                                  animation: true,
                                  percent: finishedMission/totalMission,
                                  center: Text(
                                    (finishedMission/totalMission*100).toStringAsFixed(1) + "%",
                                    style: TextStyle(
                                      fontFamily: "Microsoft YaHei",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.orange
                                    ),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: MyColors.orange,
                                  backgroundColor: MyColors.lightGrey,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ),
                  //第五个卡片，柱状图
                  Card(
                    margin: EdgeInsets.fromLTRB(5, 5, 10, 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: (width-70)/2,
                      height: (width-70)/2,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.fromLTRB(10,0,0,10),
                              child: Font16("本周 - 时间")
                          ),
                          Container(
                            child: Center(
                              child: Container(
                                child: WeeklyBarCharts(
                                  dayTime,
                                  width: (width-90)/2,
                                  height: (width-140)/2,
                                  barWidth: 13,
                                  tooltipBgColor: MyColors.grey,
                                )
                              )
                            ),
                          )
                        ],
                      )
                    )
                  ),
                ],
              ),
              //第六个卡片，月时间
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
                            Font16("本月"),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: 200,
                              height: 25,
                              child: TabBar(
                                isScrollable: true,
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                controller: this._monthTabController,
                                indicator: BoxDecoration(
                                  color: MyColors.deepOrange,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                tabs: tagTabs,
                              ),
                            )
                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: width/3,
                        child: TabBarView(
                          controller: this._monthTabController,
                          children: getLineCharts(tagTabs.length-1,width-60)
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 动态获取折线图
  /// @param n:标签的个数
  List<Widget> getLineCharts(int n, double width){
    //"全部“标签不可少
    List<Widget> lists = [
      CustomLineChart(
        times: _monthlyAllTime,
        width: width,
      )
    ];
    for(int i=0;i<n;i++){
      lists.add(
        CustomLineChart(
          times: _tagTime[i],
          width: width,
        )
      );
    }
    return lists;
  }

  /// 设置标签项
  void setTagTabs(){
    for(int i=0;i<tags.length;i++){
      tagTabs.add(
        Tab(text: tags[i],)
      );
    }
  }
}