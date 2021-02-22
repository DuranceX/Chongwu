import 'dart:convert';

import 'package:chongwu/values/MyTexts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        title: Text(MyTexts.setting,style: TextStyle(color: Colors.white),),
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(1.0,2.0),
                                      blurRadius: 2.0,
                                    )
                                  ]
                                ),
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(45)),
                                    child: Image(
                                      image: AssetImage("res/images/background.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: 100,
                                      maxWidth: 150
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Tom",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18
                                        ),
                                      ),
                                      Text(
                                        "Test@qq.com",
                                        style: TextStyle(
                                          color: Colors.black38,
                                        ),
                                      )
                                    ],
                                  )
                                )
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            child: GestureDetector(
                              onTap: (){},
                              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black54,),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 2.2,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              MyTexts.setting,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 0, 30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        DefaultTextStyle(
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            height: 2.5
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Turn on sound"),
                                              Text("Learning reminder"),
                                              Text("White List"),
                                              Text("Use Wifi only")
                                            ],
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "About",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 0, 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            height: 2.5
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Help"),
                                            Text("Contact"),
                                          ],
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}