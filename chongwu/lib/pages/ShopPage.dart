
import 'package:chongwu/values/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget{
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage> with SingleTickerProviderStateMixin{

  int _selectedIndex = 0;
  TabController tabController;
  List<Tab> shopTabs = <Tab>[
    Tab(text: "饰品"),
    Tab(text: "背景")
  ];
  String loadingTag = "##loading##";
  List<String> clothesImages = ["##loading##"];
  List<String> backgroundImages = ["##loading##"];
  List<String> backgroundNames = [];
  List<String> clothesNames = [];
  int clothesNum = 1;
  int backgroundNum = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: shopTabs.length, vsync: this);
    backgroundRetrieveImages();
    clothesRetrieveImages();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    print(size);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        title: Text(Texts.shop,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 40,
      ),
      bottomNavigationBar: new Material(
          color: Colors.grey[200],
          child: new SizedBox(
            height: 50,
            child: new TabBar(
              controller: tabController,
              tabs: shopTabs,
              onTap: onItemTapped,
              indicatorColor: Colors.deepOrangeAccent,
              labelColor: Colors.grey[800],
            ),
          )
      ),
      body: new Stack(
        children: <Widget>[
          TabBarView(
            controller: tabController,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                ),
                child: new GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1
                  ),
                  itemCount: clothesImages.length,
                  itemBuilder: (context,index){
                    if(clothesImages[index] == loadingTag){
                      if(clothesImages.length-1 < 100){
                         clothesRetrieveImages();
                         return Container(
                           padding: EdgeInsets.all(16),
                           alignment: Alignment.center,
                           child: SizedBox(
                             width: 24,
                             height: 24,
                             child: CircularProgressIndicator(strokeWidth: 2.0,),
                           ),
                         );
                      }else{
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16.0),
                          child: Text("没有更多了",style: TextStyle(color: Colors.grey),),
                        );
                      }
                    }
                    return Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: (width/2-30).floor().toDouble(),
                              minHeight: (width/2-30).floor().toDouble()-35,
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(1.0,2.0),
                                    blurRadius: 4.0,
                                  )
                                ]
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Image(image: AssetImage(clothesImages[index]),fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:10),
                            child: Text.rich(
                              new TextSpan(
                                text: "Clothes",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: clothesNames[index],
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  )
                                ]
                              )
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                ),
                child: new GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1
                  ),
                  itemCount: backgroundImages.length,
                  itemBuilder: (context,index1){
                    if(backgroundImages[index1] == loadingTag){
                      if(backgroundImages.length-1 < 100){
                        backgroundRetrieveImages();
                        return Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2.0,),
                          ),
                        );
                      }else{
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16.0),
                          child: Text("没有更多了",style: TextStyle(color: Colors.grey),),
                        );
                      }
                    }
                    return Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: (width/2-30).floor().toDouble(),
                                minHeight: (width/2-30).floor().toDouble()-35,
                                maxHeight: (width/2-30).floor().toDouble()-35
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(1.0,2.0),
                                      blurRadius: 4.0,
                                    )
                                  ]
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Image(image: AssetImage(backgroundImages[index1]),fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:10),
                            child: Text.rich(
                                new TextSpan(
                                    text: "Background",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                        text: backgroundNames[index1],
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                      )
                                    ]
                                )
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void backgroundRetrieveImages(){
    Future.delayed(Duration(milliseconds: 1000)).then((e){
      setState(() {
        backgroundImages.insertAll(backgroundImages.length-1, [
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
          "res/images/background.jpg",
        ]);
        for(int i=0;i<10;i++) {
          backgroundNames.addAll([
            backgroundNum.toString(),
          ]);
          backgroundNum++;
        }
      });
    });
  }

  void clothesRetrieveImages(){
    Future.delayed(Duration(milliseconds: 1000)).then((e){
      setState(() {
        clothesImages.insertAll(clothesImages.length-1, [
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
          "res/images/111.jpg",
        ]);
        for(int i=0;i<10;i++) {
          clothesNames.addAll([
            clothesNum.toString(),
          ]);
          clothesNum++;
        }
      });
    });
  }
}