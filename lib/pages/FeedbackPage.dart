import 'file:///E:/Work/Work_Android/Work_Android_Chongwu/lib/pages/MinePage.dart';
import 'package:chongwu/Test/PopupMenuTestPage.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget{
  FeedbackPageState createState() => FeedbackPageState();
}

class FeedbackPageState extends State<FeedbackPage>{
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
              ]
          ),
        )
    );
  }
}