import 'package:chongwu/values/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCustomCreditDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "￥",
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 20
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextField(
                    scrollPadding: EdgeInsets.all(0),
                    style: TextStyle(
                      color: MyColors.black,
                      fontSize: 36
                    ),
                    decoration: InputDecoration(
                      //isDense: true,
                      isCollapsed: true,
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: MyColors.grey,
                        fontSize: 36
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x00FF0000)),
                        borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x00000000)),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Divider(thickness: 1,),
            //SizedBox(height: 10,),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "确定",
                    style: TextStyle(
                      color: MyColors.orange,
                      fontSize: 16
                    ),
                  )
                ],
              ),
              onTap: (){},
            ),
          ],
        )
      ],
    );
  }
}