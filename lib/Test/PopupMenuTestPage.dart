import 'package:chongwu/pages/FeedbackPage.dart';
import 'file:///E:/Work/Work_Android/Work_Android_Chongwu/lib/archive/MinePage.dart';
import 'package:chongwu/pages/SettingPage.dart';
import 'package:chongwu/pages/ShopPage.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupMenuTestPage extends StatefulWidget{
  PopupMenuTestPageState createState()=> PopupMenuTestPageState();
}

class PopupMenuTestPageState extends State<PopupMenuTestPage>{

  OverlayEntry _overlayEntry;
  bool _flag = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuTestPage"),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              if(_flag == true){
                _overlayEntry.remove();
                _overlayEntry = null;
              }
              else {
                _overlayEntry = OverlayEntry(
                  builder: (context) =>
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 90),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(1.0, 2.0),
                                    blurRadius: 4.0,
                                  )
                                ]
                            ),
                            child: SizedBox(
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                        return new ShopPage();
                                                      }));
                                              _overlayEntry.remove();
                                              _overlayEntry = null;
                                              setState(() {
                                                _flag = !_flag;
                                              });
                                            },
                                            child: Container(
                                              child: Center(
                                                child: SizedBox(
                                                  width: width / 3,
                                                  height: width / 4,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Colors.deepOrangeAccent,
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    ),
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.storefront,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                          Text(MyTexts.shop,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w100,
                                                              decoration: TextDecoration.none,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            )
                                          )
                                        ],
                                      ),
                                      Container(height: 150, child: VerticalDivider(color: Colors.grey)),
                                      Stack(
                                        children: <Widget>[
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          return new FeedbackPage();
                                                        }));
                                                _overlayEntry.remove();
                                                _overlayEntry = null;
                                                setState(() {
                                                  _flag = !_flag;
                                                });
                                              },
                                              child: Container(
                                                  child: Center(
                                                    child: SizedBox(
                                                      width: width / 3,
                                                      height: width / 4,
                                                      child: DecoratedBox(
                                                        decoration: BoxDecoration(
                                                          color: Colors.deepOrangeAccent,
                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                        ),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.comment,
                                                                color: Colors.white,
                                                                size: 30,
                                                              ),
                                                              Text(MyTexts.feedback,
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w100,
                                                                  decoration: TextDecoration.none,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(height: 0,thickness: 1),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          return new MinePage();
                                                        }));
                                                _overlayEntry.remove();
                                                _overlayEntry = null;
                                                setState(() {
                                                  _flag = !_flag;
                                                });
                                              },
                                              child: Container(
                                                  child: Center(
                                                    child: SizedBox(
                                                      width: width / 3,
                                                      height: width / 4,
                                                      child: DecoratedBox(
                                                        decoration: BoxDecoration(
                                                          color: Colors.deepOrangeAccent,
                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                        ),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.person,
                                                                color: Colors.white,
                                                                size: 30,
                                                              ),
                                                              Text(MyTexts.mine,
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w100,
                                                                  decoration: TextDecoration.none,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                              )
                                          )
                                        ],
                                      ),
                                      Container(height: 150, child: VerticalDivider(color: Colors.grey)),
                                      Stack(
                                        children: <Widget>[
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          return new SettingPage();
                                                        }));
                                                _overlayEntry.remove();
                                                _overlayEntry = null;
                                                setState(() {
                                                  _flag = !_flag;
                                                });
                                              },
                                              child: Container(
                                                  child: Center(
                                                    child: SizedBox(
                                                      width: width / 3,
                                                      height: width / 4,
                                                      child: DecoratedBox(
                                                        decoration: BoxDecoration(
                                                          color: Colors.deepOrangeAccent,
                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                        ),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.settings,
                                                                color: Colors.white,
                                                                size: 30,
                                                              ),
                                                              Text(MyTexts.setting,
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w100,
                                                                  decoration: TextDecoration.none,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(child: GestureDetector(onTap: () {
                            _overlayEntry.remove();
                            _overlayEntry = null;
                            setState(() {
                              _flag = !_flag;
                            });
                          })),
                        ],
                      ),
                );
                Overlay.of(context).insert(_overlayEntry);
              }
              setState(() {
                _flag = !_flag;
              });
            },
            child: Icon(Icons.build),
          )
        ],
        leading: BackButton(
          onPressed: (){
            if(_flag == true){
              _overlayEntry.remove();
              _overlayEntry = null;
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}