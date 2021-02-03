import 'package:chongwu/values/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Text("占位符",style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}