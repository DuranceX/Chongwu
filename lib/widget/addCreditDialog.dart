import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/widget/addCustomCreditDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCreditDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              //方块金额
              DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 70,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                      text: "￥",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      children: [
                                        TextSpan(text: "5",style: TextStyle(fontSize: 25))
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 70,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                      text: "￥",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      children: [
                                        TextSpan(text: "10",style: TextStyle(fontSize: 25))
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 70,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                      text: "￥",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      children: [
                                        TextSpan(text: "15",style: TextStyle(fontSize: 25))
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 70,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                      text: "￥",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      children: [
                                        TextSpan(text: "20",style: TextStyle(fontSize: 25))
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 70,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                      text: "￥",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      children: [
                                        TextSpan(text: "25",style: TextStyle(fontSize: 25))
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 70,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                      text: "￥",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      children: [
                                        TextSpan(text: "50",style: TextStyle(fontSize: 25))
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              //自定义金额
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "其他金额",
                      style: TextStyle(
                          color: MyColors.grey
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        child: AddCustomCreditDialog(),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}