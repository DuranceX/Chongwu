import 'package:chongwu/pages/DioTestPage.dart';
import 'package:chongwu/values/Texts.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DemoFlowPopMenu.dart';

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
        leading: BackButton(color: Colors.white,),
        toolbarHeight: 40,
        title: Text(Texts.feedback,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("占位符",style: TextStyle(fontSize: 30),),
          SizedBox(
            height: 200,
            child: DemoFlowPopMenu(),
          ),
          SizedBox(
              height: 150,
              width: width-40,
              child: InkWell(
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black38,
                            //     offset: Offset(1.0,2.0),
                            //     blurRadius: 4.0,
                            //   )
                            // ]
                          color: Colors.blue,
                        ),
                        child: SizedBox(
                          height: 160,
                          width: width-40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image(
                              image: AssetImage("res/images/background.jpg"),
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
                    RaisedButton(
                      child: Text("Dio Test"),
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context){
                              return DioTestPage();
                            }
                          )
                        );
                      },
                    )
                  ],
                ),
              )
          ),
          // SizedBox(
          //   height: 400,
          //   child: FocusImageDemo(),
          // )
        ]
      )
    );
  }
}