import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioTestPage extends StatefulWidget{
  DioTestPageState createState()=> DioTestPageState();
}

class DioTestPageState extends State<DioTestPage>{

  List _list = [];

  void _getData() async{
    String Url = "http://a.itying.com/api/productlist";
    Response response = await Dio(new BaseOptions(responseType: ResponseType.plain)).get(Url);
    setState(() {
      _list = json.decode(response.data.toString())['result'];
    });
    print(_list[0]["list"][0]["title"]);
    print(_list[0]["list"].length);
  }

  List<Widget> _getSubTitle(context,index){
    List<Widget> _tempList = [];
    if(_list[index]["list"].length != 0) {
      for (var i = 0; i < _list[index]["list"].length; i++) {
        _tempList.add(Text(
          _list[index]["list"][i]["title"],
          )
        );
      }
    }
    return _tempList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Test"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 600,
            child: _list.length>0?
            ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(_list[index]["title"]),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          children: _getSubTitle(context,index),
                        ),
                      )
                    ],
                  );
                }
            ):Text("Loading"),
          ),
          RaisedButton(child: Text("按钮"),onPressed:_getData),
        ],
      ),
    );
  }
}