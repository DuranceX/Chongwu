import 'package:flutter/material.dart';

/**
 * 自定义进度条
 */
class RadiusLinearProcess extends StatelessWidget {
  RadiusLinearProcess(
      {Key key,
        this.width,
        this.height,
        this.bgColor,
        this.frColor,
        this.borderRaius,
        this.value=1})
      : super(key: key);
  // 宽度-必填
  final double width;
  // 高度-必填
  final double height;
  // 背景色
  final Color bgColor;
  // 前景色
  final Color frColor;
  // 圆角
  final double borderRaius;
  // 当前比例(当前值/总数值)-必填
  final double value;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sysWidth = size.width;
    final sysHeight = 10;
    return Container(
        width: width ?? sysWidth,
        height: height ?? sysHeight,
        child: Stack(
          children: <Widget>[
            Container(
              width: width ?? sysWidth,
              height: height ?? sysHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(height ?? sysHeight)),
                  color: bgColor ?? Colors.blue),
            ),
            Container(
              height: height ?? sysHeight,
              width: width*value ?? 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(height ?? sysHeight)),
                  color: frColor ?? Colors.lightBlueAccent),
              // child: new AspectRatio(
              //   aspectRatio: 1
              //   //width != null && height != null && value!=null ? value*sysWidth / height: value*(sysHeight),
              // ),
            ),
          ],
        ));
  }
}