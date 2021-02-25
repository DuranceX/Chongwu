import 'package:chongwu/pages/PhotoViewPage.dart';
import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/values/MyIcons.dart';
import 'package:flutter/material.dart';

import 'BoughtDialog.dart';

class SetItemWidget extends StatelessWidget{

  final String imageUrl;
  final String imageText;
  final bool bought;
  final int price;
  OverlayEntry overlayEntry;
  OverlayEntry _boughtDialog;

  SetItemWidget({
    @required this.imageUrl,
    @required this.imageText,
    @required this.bought,
    @required this.price,
    @required this.overlayEntry,
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
            //白框
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: SizedBox(
                width: width/1.5,
                height: width/1.4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            //offset: Offset(1.5,3.0),
                            blurRadius: 5.0
                        )
                      ]
                  ),
                  child: Column(
                    children: <Widget>[
                      //图片
                      GestureDetector(
                        child: AspectRatio(
                            aspectRatio: 1.3,
                            child: Container(
                              margin: EdgeInsets.all(12),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  child: Image(
                                    image: AssetImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                        ),
                        onTap: (){
                          overlayEntry.remove();
                          overlayEntry = null;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) {
                                  return PhotoViewPage(
                                    image: imageUrl,);
                                }));
                        },
                      ),
                      //介绍文本
                      Container(
                        padding: EdgeInsets.fromLTRB(13, 0, 13, 13),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                imageText,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Wrap(
                                children: <Widget>[
                                  Text(
                                    "This is a Test Description",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: MyColors.grey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
            //按钮
            getStatus(bought,context)
          ],
        ),
      )
    );
  }

  Widget getStatus(bool bought,BuildContext context){
    if(bought){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 130),
        decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: MyColors.grey,
                  offset: Offset(0, 3.0),
                  blurRadius: 1.0
              )
            ]
        ),
        child: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              "未拥有",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.none
              ),
            ),
          )
        ),
      );
    }
    else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 130),
        decoration: BoxDecoration(
            color: MyColors.orange,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: MyColors.deepOrange,
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
                child: Center(
                  child: Text(
                    "放置",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                )
              ),
            ]
          ),
        ),
      );
    }
  }
}