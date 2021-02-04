import 'dart:convert';

import 'package:chongwu/pages/DemoFlowPopMenu.dart';
import 'package:chongwu/values/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FeedbackPage.dart';
import 'MinePage.dart';
import 'ShopPage.dart';

class SettingPage extends StatefulWidget{
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage>{

  bool _studyTogether = true;
  bool _keepScreen = true;
  bool _openMusic = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        toolbarHeight: 40,
        title: Text(Texts.setting,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              children: <Widget>[
                Text("账号",style: TextStyle(fontSize: 15,color: Colors.black54),),
                Divider(height: 5,thickness: 1,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 30),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          height: 2.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("用户名"),
                            Text("云端同步"),
                            Text("忘记密码"),
                            Text("导出数据")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Text("宠物",style: TextStyle(fontSize: 15,color: Colors.black54),),
                Divider(height: 5,thickness: 1,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 30),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18.0,
                          height: 1.8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("宠物名"),
                            Text("宠物种类"),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("是否可以与好友一起学习"),
                                SizedBox(
                                  height: 18.0*2.0,
                                  child: Switch(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: _studyTogether,
                                      onChanged: (value){
                                        setState(() {
                                          _studyTogether = value;
                                        });
                                      }
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Text("设置",style: TextStyle(fontSize: 15,color: Colors.black54),),
                Divider(height: 5,thickness: 1,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 30),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18.0,
                          height: 1.8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("保持屏幕开启"),
                                SizedBox(
                                  height: 18.0*2,
                                  child: Switch(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: _keepScreen,
                                      onChanged: (value){
                                        setState(() {
                                          _keepScreen = value;
                                        });
                                      }
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("开启音效"),
                                SizedBox(
                                  height: 18.0*2.0,
                                  child: Switch(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: _openMusic,
                                      onChanged: (value){
                                        setState(() {
                                          _openMusic = value;
                                        });
                                      }
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("进阶设定"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text("关于",style: TextStyle(fontSize: 15,color: Colors.black54),),
                Divider(height: 5,thickness: 1,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 30),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18.0,
                          height: 2.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("常见问题"),
                            Text("联系我们")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}