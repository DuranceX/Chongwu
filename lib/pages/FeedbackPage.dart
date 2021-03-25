import 'package:chongwu/Test/PopupMenuTestPage.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MinePage.dart';

class FeedbackPage extends StatefulWidget{
  FeedbackPageState createState() => FeedbackPageState();
}

class FeedbackPageState extends State<FeedbackPage>{

  String testStr="Test Output";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          toolbarHeight: 40,
          title: Text(
            MyTexts.feedback,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("占位符",style: TextStyle(fontSize: 30),),
                SizedBox(
                    height: 150,
                    width: width-40,
                    child: InkWell(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                              ),
                              child: SizedBox(
                                height: 160,
                                width: width-40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: Image(
                                    image: NetworkImage("http://47.114.76.8/media/t1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // child: ClipRRect(
                              //   borderRadius: BorderRadius.all(Radius.circular(10)),
                              //   child: Image(
                              //     image: AssetImage("res/images/background.jpg"),
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                            ),
                          ),
                          new DecoratedBox(
                            decoration: new BoxDecoration(
                                gradient: new LinearGradient(
                                    begin: FractionalOffset.bottomCenter,
                                    end: FractionalOffset.topCenter,
                                    colors: [
                                      const Color(0xFF000000),
                                      const Color(0x33FFC0CB),
                                    ]
                                )
                            ),
                          ),
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            child: Text(
                              "CoverImages",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              RaisedButton(
                                child: Text("PopupMenuTest"),
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context){
                                            return PopupMenuTestPage();
                                          }
                                      )
                                  );
                                },
                              ),
                              RaisedButton(
                                child: Text("New MinePage"),
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context){
                                            return MinePage();
                                          }
                                      )
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
                SizedBox(height: 50,),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () async {
                        String temp = await _getData("http://47.114.76.8/api/login/1", {"username":"test2","password":"qwer1234"});
                        setState((){
                          testStr = temp;
                        });
                      },
                      child: Text("登录成功"),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        String temp = await _getData("http://47.114.76.8/api/login/1", {"username":"test452","password":"test1"});
                        setState((){
                          testStr = temp;
                        });
                      },
                      child: Text("用户名未注册"),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        String temp = await _getData("http://47.114.76.8/api/login/1", {"username":"test2","password":"test1"});
                        setState((){
                          testStr = temp;
                        });
                      },
                      child: Text("密码错误"),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () async {
                        String temp = await _getData("http://47.114.76.8/api/login/1", {"username":"test2","password":"test1"});
                        setState((){
                          testStr = temp;
                        });
                      },
                      child: Text("DioTest04"),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        String temp = await _getData("http://47.114.76.8/api/login/1", {"username":"test2","password":"test1"});
                        setState((){
                          testStr = temp;
                        });
                      },
                      child: Text("DioTest05"),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        String temp = await _getData("http://47.114.76.8/api/login/1", {"username":"test2","password":"test1"});
                        setState((){
                          testStr = temp;
                        });
                      },
                      child: Text("DioTest06"),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text(testStr)
              ]
          ),
        )
    );
  }
}

Future<String> _getData(String url ,dynamic data) async{
  String Url = url;
  try{
    Response response = await Dio().post(Url,data:data);
    return response.data.toString();
  } on DioError catch(e){
    if(e.response != null){
      return e.response.data.toString();
    }
    else{
      return e.message.toString();
    }
  }
  // setState(() {
  //   _list = json.decode(response.data.toString())['result'];
  // });
  // print(_list[0]["list"][0]["title"]);
  // print(_list[0]["list"].length);
}