import 'package:flutter/material.dart';

class MyTexts{
  static const String shop = "商店";
  static const String setting = "设置";
  static const String mine = "我的";
  static const String feedback = "反馈";
  static const String album = "相册";
  static const String backpack = "背包";
  static const String memoriesOverview="回忆目录";
}

class Font10 extends StatelessWidget{
  Font10(
      this.text,
      {Key key,
        this.color,
      }):super(key: key);

  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: 10,
          fontFamily: "Microsoft YaHei",
          color: color ?? Colors.black87
      ),
    );
  }
}

class Font12 extends StatelessWidget{
  Font12(
      this.text,
      {Key key,
        this.color,
      }):super(key: key);

  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: 12,
          fontFamily: "Microsoft YaHei",
          color: color ?? Colors.black87
      ),
    );
  }
}

class Font14 extends StatelessWidget{
  Font14(
      this.text,
      {Key key,
        this.color,
      }):super(key: key);

  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          fontFamily: "Microsoft YaHei",
          color: color ?? Colors.black87
      ),
    );
  }
}

class Font16 extends StatelessWidget{
  Font16(
    this.text,
    {Key key,
    this.color,
  }):super(key: key);

  String text;
   Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontFamily: "Microsoft YaHei",
        color: color ?? Colors.black87
      ),
    );
  }
}

class Font20 extends StatelessWidget{
  Font20(
      this.text,
      {Key key,
        this.color,
      }):super(key: key);

  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontFamily: "Microsoft YaHei",
          color: color ?? Colors.black87
      ),
    );
  }
}

class Font36 extends StatelessWidget{
  Font36(
      this.text,
      {Key key,
        this.color,
      }):super(key: key);

  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: 36,
          fontFamily: "Microsoft YaHei",
          color: color ?? Colors.black87
      ),
    );
  }
}