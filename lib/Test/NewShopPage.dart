import 'package:chongwu/pages/PhotoViewPage.dart';
import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:chongwu/widget/ShopItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget{
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage> with SingleTickerProviderStateMixin{

  int _selectedIndex = 0;
  TabController tabController;
  List<Tab> shopTabs = <Tab>[
    Tab(child: Text("物品"),),
    Tab(text: "玩具"),
    Tab(text: "服饰"),
    Tab(text: "音乐"),
  ];
  String loadingTag = "##loading##";
  List<String> clothesImages = ["##loading##"];
  List<String> backgroundImages = ["##loading##"];
  List<String> backgroundNames = [];
  List<String> clothesNames = [];
  List<bool> boughts = [];
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
        backgroundColor: MyColors.orange,
        leading: BackButton(color: Colors.white,),
        title: Text(MyTexts.shop,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: shopTabs,
          indicator: BoxDecoration(
            color: MyColors.deepOrange,
            borderRadius: BorderRadius.circular(30),
          ),
          labelColor: Colors.white,
        ),
      ),
      body: new Stack(
        children: <Widget>[
          Container(
            color: MyColors.lightGrey,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    child: new GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8
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
                          return ShopItemWidget(
                            imageUrl: clothesImages[index],
                            imageText: "Item" + index.toString(),
                            bought: boughts[index],
                            price: 800,
                          );
                        }
                    ),
                  ),
                ),
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    child: new GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8
                        ),
                        itemCount: backgroundImages.length,
                        itemBuilder: (context,index){
                          if(backgroundImages[index] == loadingTag){
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
                          return ShopItemWidget(
                            imageUrl: backgroundImages[index],
                            imageText: "背景" + index.toString(),
                            bought: boughts[index],
                            price: 3000,
                          );
                        }
                    ),
                  ),
                ),
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    child: new GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8
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
                          return ShopItemWidget(
                            imageUrl: clothesImages[index],
                            imageText: "Clothes" + index.toString(),
                            bought: boughts[index],
                            price: 1000,
                          );
                        }
                    ),
                  ),
                ),
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    child: new GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8
                        ),
                        itemCount: backgroundImages.length,
                        itemBuilder: (context,index){
                          if(backgroundImages[index] == loadingTag){
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
                          return ShopItemWidget(
                            imageUrl: backgroundImages[index],
                            imageText: "Music" + index.toString(),
                            bought: boughts[index],
                            price: 2500,
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
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
        for(int i=0;i<10;i++){
          boughts.addAll([
            true,
          ]);
        }
        boughts[5] = false;
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
        for(int i=0;i<10;i++){
          boughts.addAll([
            true,
          ]);
        }
      });
    });
  }
}
