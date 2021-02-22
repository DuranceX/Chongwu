import 'package:chongwu/values/MyColors.dart';
import 'package:flutter/material.dart';

import 'Button.dart';

class BoughtDialog extends StatelessWidget{

  final String imageText;
  final int price;
  OverlayEntry boughtDialog;

  BoughtDialog({
    @required this.imageText,
    @required this.price,
    @required this.boughtDialog,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      child: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: SizedBox(
                width: width/1.5,
                child: AspectRatio(
                  aspectRatio: 1.65,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "解锁",
                            style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize: 20
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Wrap(
                          children: <Widget>[
                            Text(
                              "确定花费" + price.toString() + "小鱼干解锁" + imageText + "?",
                              style: TextStyle(
                                color: MyColors.grey,
                                fontSize: 14,
                                decoration: TextDecoration.none
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            // RaisedButton(
                            //   child: Center(
                            //     child: Text(
                            //       "取消",
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 16
                            //       ),
                            //     ),
                            //   ),
                            //   color: Colors.grey,
                            //   onPressed: (){
                            //     boughtDialog.remove();
                            //     boughtDialog = null;
                            //   }
                            // ),
                            Button(
                              "取消",
                              (){
                                boughtDialog.remove();
                                boughtDialog = null;
                              },
                              color: MyColors.grey,
                              height: width/10-5,
                              width: width/4,
                              shadowColor: Colors.black38
                            ),
                            Button(
                              "确定", (){},
                              height:width/10-5,
                              width: width/4
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ),
              )
            )
          ],
        ),
      )
    );
  }
}