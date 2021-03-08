import 'package:chongwu/values/MyColors.dart';
import 'package:chongwu/values/MyIcons.dart';
import 'package:chongwu/values/MyTexts.dart';
import 'package:chongwu/widget/BackpackItemWidget.dart';
import 'package:chongwu/widget/AddCreditDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackpackPage extends StatefulWidget{
  BackpackPageState createState() => BackpackPageState();
}

class BackpackPageState extends State<BackpackPage> with SingleTickerProviderStateMixin{

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
  int totalCoin = 2000;

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
        title: Text(MyTexts.backpack,style: TextStyle(color: Colors.white),),
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
        actions: [
          //鱼干
          Container(
              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(color: Colors.white,width: 4)
              ),
              child: SizedBox(
                  width: 40,
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          MyIcons.fish,
                          color: Colors.white,
                          size:20,
                        ),
                        Text(
                          totalCoin.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return AddCreditDialog().build(context);
                        },
                      );
                    },
                  )
              )
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          Container(
            color: MyColors.lightGrey,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                //物品
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
                          return BackpackItemWidget(
                            imageUrl: clothesImages[index],
                            imageText: "Item" + index.toString(),
                            bought: boughts[index],
                            price: 800,
                          );
                        }
                    ),
                  ),
                ),
                //玩具
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
                          return BackpackItemWidget(
                            imageUrl: backgroundImages[index],
                            imageText: "背景" + index.toString(),
                            bought: boughts[index],
                            price: 3000,
                          );
                        }
                    ),
                  ),
                ),
                //服饰
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
                          return BackpackItemWidget(
                            imageUrl: clothesImages[index],
                            imageText: "Clothes" + index.toString(),
                            bought: boughts[index],
                            price: 1000,
                          );
                        }
                    ),
                  ),
                ),
                //音乐
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
                          return BackpackItemWidget(
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
            false,
          ]);
        }
        boughts[5] = true;
      });
    });
  }

  void clothesRetrieveImages(){
    Future.delayed(Duration(milliseconds: 1000)).then((e){
      setState(() {
        clothesImages.insertAll(clothesImages.length-1, [
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
          "res/images/dog.png",
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
