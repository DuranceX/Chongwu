import 'package:flutter/material.dart';

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

  int _selectedIndex = 0;
  TabController tabController;
  List<Tab> bottomTabs = <Tab>[
    Tab(icon: Icon(Icons.menu_book_rounded,),text: "Learn",iconMargin: EdgeInsets.only(bottom: 0),),
    Tab(icon: Icon(Icons.sports_basketball),text: "Play",iconMargin: EdgeInsets.only(bottom: 0),)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: onItemTapped,
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
                      child: Text("This is Learning Page",textScaleFactor: 2.0,style: TextStyle(color: Colors.white),),
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
                      child: Text("This is Play Page",textScaleFactor: 2.0,style: TextStyle(color: Colors.white),),
                    )
                ),
              ]
          ),
          new AppBar(
            toolbarHeight: 50,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title,style: TextStyle(color: Colors.white),),
            actions: <Widget>[
              PopupMenuButton<Text>(
                icon: Icon(Icons.list_rounded,size: 35,color: Colors.grey,),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text(
                        "first",
                      ),
                    ),
                    PopupMenuItem(
                      child: Text(
                        "second",
                      ),
                    ),
                    PopupMenuItem(
                      child: Text(
                        "third",
                      ),
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
      _selectedIndex = index;
    });
  }

  void startLearn(){

  }
}
