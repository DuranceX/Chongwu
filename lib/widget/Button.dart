import 'package:chongwu/values/MyColors.dart';
import 'package:flutter/material.dart';

Widget Button(
  String text,
  Function onTap,
  {
    double height = 40,
    double width = 120,
    Color color = MyColors.orange,
    Color shadowColor = MyColors.deepOrange,
    IconData icon,
    Color iconColor = Colors.white,
    Color textColor = Colors.white
  })
  {
  return SizedBox(
    height: height,
    width: width,
    child: Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                offset: Offset(0, 3.0),
                blurRadius: 1.0
            )
          ]
      ),
      child: GestureDetector(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          text,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        setIcon(icon,iconColor),
                      ],
                    ),
                  ],
                )
              )
            ]
        ),
        onTap: onTap,
      ),
    ),
  );
}

Widget setIcon(IconData icon,Color iconColor){
  if(icon != null) {
    return Icon(icon, color: iconColor,);
  }
  else{
    return SizedBox(width: 0,);
  }
}
