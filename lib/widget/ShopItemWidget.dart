import 'package:chongwu/pages/PhotoViewPage.dart';
import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/values/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopItemWidget extends StatelessWidget{

  final String imageUrl;
  final String imageText;
  final bool bought;
  final int price;

  ShopItemWidget({
    @required this.imageUrl,
    @required this.imageText,
    @required this.bought,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print((width/2).floorToDouble(),);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    content: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 175,
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: InkWell(
                              child: Image(image: AssetImage(imageUrl),),
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) {
                                          return PhotoViewPage(
                                            image: imageUrl,);
                                        }
                                    )
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Center(
                              child: Text(imageText),
                            ),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      OutlineButton(child: Text('取消',style: TextStyle(fontSize: 18),),onPressed: (){Navigator.pop(context);},),
                      OutlineButton(child: Text('购买',style: TextStyle(fontSize: 18),),onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                  content: Text("确认购买"),
                                  actions: <Widget>[
                                    OutlineButton(child: Text('取消',style: TextStyle(fontSize: 18),),onPressed: (){Navigator.pop(context);},),
                                    OutlineButton(child: Text('购买',style: TextStyle(fontSize: 18),),onPressed: (){}),
                                  ]
                              );
                            }
                        );
                      },),
                    ],
                  );
                }
              );
            },
            child: Column(
              children: <Widget>[
                // ConstrainedBox(
                //   constraints: BoxConstraints(
                //     minWidth: (width/2-30).floor().toDouble(),
                //     minHeight: (width/2-30).floor().toDouble()-35,
                //   ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
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
                      AspectRatio(
                        aspectRatio: 1.1,
                        child: Container(
                          margin: EdgeInsets.all(10),
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
                      Padding(
                        padding: EdgeInsets.only(top:0),
                        child: Text(
                          imageText,
                          style: TextStyle(
                              fontSize: 16
                          ),
                        )
                      ),
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Center(
                    child: getStatus(bought,price),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getStatus(bool bought,int price){
    if(bought){
      return Text(
        "已拥有",
        style: TextStyle(
          color: MyColors.grey,
          fontSize: 14
        ),
      );
    }
    else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            price.toString(),
            style: TextStyle(
              color: MyColors.orange,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Icon(
            MyIcons.fish,
            color: MyColors.orange,
          ),
        ],
      );
    }
  }
}