import 'package:chongwu/pages/MemoriesOverviewPage.dart';
import 'package:chongwu/pages/SettingPage.dart';
import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/values/MyIcons.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:flutter/material.dart';

import 'BackpackPage.dart';
import 'FeedbackPage.dart';
import 'MinePage.dart';
import 'ShopPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController tabController;
  List<Tab> bottomTabs = <Tab>[
    Tab(icon: Icon(Icons.menu_book_rounded,),text: "Learn",iconMargin: EdgeInsets.only(bottom: 0),),
    Tab(icon: Icon(Icons.sports_basketball),text: "Play",iconMargin: EdgeInsets.only(bottom: 0),)
  ];
  String _bodyStr1 = "This is Learning Page";
  String _bodyStr2 = "This is Play Page";

  //4个跳转按钮相关
  OverlayEntry _overlayEntry;
  bool _flag = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final menuWidth = width / 4;
    final menuHeight = width / 3.2;
    final menuPhotoHeight = width / 4;
    final padding = MediaQuery.of(context).padding.top;
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 50,
      //   centerTitle: true,
      //   elevation: 0,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title,style: TextStyle(color: Colors.white),),
      //   actions: <Widget>[
      //     IconButton(icon: Icon(Icons.list_rounded), onPressed: (){},color: Colors.white,)
      //   ],
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined),label: "Study"),
      //     BottomNavigationBarItem(icon: Icon(Icons.sports_basketball),label: "Play")
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.deepOrangeAccent,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: onItemTapped,
      // ),
      bottomNavigationBar: new Material(
          color: Colors.white,
          child: new SizedBox(
            height: 50,
            child: new TabBar(
              controller: tabController,
              tabs: bottomTabs,
              //onTap: onItemTapped,
              indicatorColor: Colors.white,
              labelColor: Colors.deepOrangeAccent,
              unselectedLabelColor: Colors.grey,
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: startLearn,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: new Stack(
        children: [
          TabBarView(
              controller: tabController,
              children: <Widget>[
                //Learn页面的内容
                ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage("res/images/background.jpg"),
                            fit: BoxFit.cover
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(_bodyStr1,textScaleFactor: 2.0,style: TextStyle(color: Colors.white),),
                    )
                ),
                //Play页面的内容
                ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage("res/images/background.jpg"),
                            fit: BoxFit.cover
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(_bodyStr2,textScaleFactor: 2.0,style: TextStyle(color: Colors.white),),
                    )
                ),
              ]
          ),
          new AppBar(
            toolbarHeight: 40,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title,style: TextStyle(color: Colors.white),),
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
                                margin: EdgeInsets.only(top: padding + 40),
                                decoration: BoxDecoration(
                                    color: MyColors.orange,
                                    borderRadius: BorderRadius.circular(15),
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
                                  width: width - 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          //商店
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
                                                        width: menuWidth,
                                                        height: menuHeight,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: menuWidth,
                                                              height: menuPhotoHeight,
                                                              child: DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.deepOrangeAccent,
                                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  ),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                      child: Image(
                                                                        image: AssetImage("res/images/dog.png"),
                                                                        fit: BoxFit.cover,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                            Text(
                                                              MyTexts.shop,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Microsoft YaHei",
                                                                fontSize: 16,
                                                                decoration: TextDecoration.none,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                          //Container(height: 125, child: VerticalDivider(color: Colors.grey,width: 10,)),
                                          //背包
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          return new BackpackPage();
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
                                                        width: menuWidth,
                                                        height: menuHeight,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: menuWidth,
                                                              height: menuPhotoHeight,
                                                              child: DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.deepOrangeAccent,
                                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  ),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                      child: Image(
                                                                        image: AssetImage("res/images/dog.png"),
                                                                        fit: BoxFit.cover,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                            Text(
                                                              MyTexts.backpack,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Microsoft YaHei",
                                                                fontSize: 16,
                                                                decoration: TextDecoration.none,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                          //Container(height: 125, child: VerticalDivider(color: Colors.grey)),
                                          //相册
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          return new MemoriesOverviewPage();
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
                                                        width: menuWidth,
                                                        height: menuHeight,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: menuWidth,
                                                              height: menuPhotoHeight,
                                                              child: DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.deepOrangeAccent,
                                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  ),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                      child: Image(
                                                                        image: AssetImage("res/images/dog.png"),
                                                                        fit: BoxFit.cover,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                            Text(
                                                              MyTexts.album,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Microsoft YaHei",
                                                                fontSize: 16,
                                                                decoration: TextDecoration.none,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                        ],
                                      ),
                                      //Divider(height: 0,thickness: 1),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          //我的
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
                                                        width: menuWidth,
                                                        height: menuHeight,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: menuWidth,
                                                              height: menuPhotoHeight,
                                                              child: DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.deepOrangeAccent,
                                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  ),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                      child: Image(
                                                                        image: AssetImage("res/images/dog.png"),
                                                                        fit: BoxFit.cover,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                            Text(
                                                              MyTexts.mine,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Microsoft YaHei",
                                                                fontSize: 16,
                                                                decoration: TextDecoration.none,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                          //Container(height: 125, child: VerticalDivider(color: Colors.grey)),
                                          //设置
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
                                                        width: menuWidth,
                                                        height: menuHeight,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: menuWidth,
                                                              height: menuPhotoHeight,
                                                              child: DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.deepOrangeAccent,
                                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  ),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                      child: Image(
                                                                        image: AssetImage("res/images/dog.png"),
                                                                        fit: BoxFit.cover,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                            Text(
                                                              MyTexts.setting,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Microsoft YaHei",
                                                                fontSize: 16,
                                                                decoration: TextDecoration.none,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                          //Container(height: 125, child: VerticalDivider(color: Colors.grey)),
                                          //空白——用于测试
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
                                                        width: menuWidth,
                                                        height: menuHeight,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: menuWidth,
                                                              height: menuPhotoHeight,
                                                              child: DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.deepOrangeAccent,
                                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  ),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                      child: Image(
                                                                        image: AssetImage("res/images/dog.png"),
                                                                        fit: BoxFit.cover,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                            Text(
                                                              "测试",
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Microsoft YaHei",
                                                                fontSize: 16,
                                                                decoration: TextDecoration.none,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  )
                                              )
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
                child: Icon(MyIcons.menu,color: Colors.grey,),
              )
            ],
          ),
        ],
      ),
    );
  }


  void onItemTapped(int index){
    setState(() {
    });
  }

  void startLearn(){

  }
}
