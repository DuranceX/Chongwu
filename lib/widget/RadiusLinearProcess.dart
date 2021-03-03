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
    return Container(
        width: width ?? 100,
        height: height ?? 10,
        child: Stack(
          children: <Widget>[
            Container(
              width: width ?? 100,
              height: height ?? 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(height ?? 10)),
                  color: bgColor ?? Colors.blue),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(height ?? 10)),
                  color: frColor ?? Colors.lightBlueAccent),
              child: new AspectRatio(
                aspectRatio:
                width != null && height != null && value!=null ? value*width / height : value*(10),
              ),
            ),
          ],
        ));
  }
}