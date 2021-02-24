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
            SizedBox(height: 40,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "￥",
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 20
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(
                        color: MyColors.grey,
                        fontSize: 25
                    ),
                    decoration: InputDecoration(
                        hintText: "0"
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}