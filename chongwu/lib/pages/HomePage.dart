import 'package:chongwu/pages/SettingPage.dart';
import 'package:chongwu/values/MyIcons.dart';
import 'package:chongwu/values/Texts.dart';
import 'package:flutter/material.dart';

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
                ConstrainedBox(                                   //Learn页面的内容
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
                ConstrainedBox(                                 //Play页面的内容
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
              PopupMenuButton<String>(
                icon: Icon(MyIcons.menu,size: 30,color: Colors.grey,),
                onSelected: (String value){
                  if(value == "Shop"){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ShopPage();
                    }));
                  }
                  else if (value == "Setting"){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new SettingPage();
                    }));
                  }
                  else if (value == "Mine"){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new MinePage();
                    }));
                  }
                  else if (value == "Feedback"){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new FeedbackPage();
                    }));
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        value: "Shop",
                        child: Stack(
                          children: <Widget>[
                            Container(
                                child: SizedBox(
                                  width: width/3,
                                  height: width/4,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.storefront,color: Colors.white,),
                                          Text(Texts.shop,style: TextStyle(color: Colors.white),)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            )
                          ],
                        )
                    ),
                    PopupMenuItem(
                      value: "Mine",
                      child: Text(
                        Texts.mine,
                      ),
                    ),
                    PopupMenuItem(
                      value: "Feedback",
                      child: Text(
                        Texts.feedback,
                      ),
                    ),
                    PopupMenuItem(
                      value: "Setting",
                      child: Text(
                        Texts.setting
                      )
                    ),
                  ];
                },
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
