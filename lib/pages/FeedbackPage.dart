import 'package:chongwu/pages/FocusImages.dart';
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
          // SizedBox(
          //   height: 400,
          //   child: FocusImageDemo(),
          // )
          ExtendedImage(
            image: AssetImage("res/images/111.jpg"),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}