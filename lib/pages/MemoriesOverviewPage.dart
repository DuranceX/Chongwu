import 'package:chongwu/pages/SingleSeriesPhotosPage.dart';
import 'package:chongwu/values/Texts.dart';
import 'package:flutter/material.dart';

class MemoriesOverviewPage extends StatelessWidget{

  List coverImages = [
    {
      "title": "Cat Memory",
      "imageUrl": "res/images/background.jpg"
    },
    {
      "title": "Universe Adventure",
      "imageUrl": "res/images/111.jpg"
    },
    {
      "title": "Forest Area",
      "imageUrl": "res/images/2.jpg"
    },
    {
      "title": "Ice Age",
      "imageUrl": "res/images/3.png"
    },
    {
      "title": "TechCat",
      "imageUrl": "res/images/background.jpg"
    }
  ];

  Widget _getListData(context,index){
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        // child: SizedBox(
        //   height: 180,
        //   width: width-40,
        child: InkWell(
          child: Stack(
            children: <Widget>[
              DecoratedBox(
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
                child: SizedBox(
                  height: 160,
                  width: width-40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      image: AssetImage(coverImages[index]["imageUrl"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ),
              DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromRGBO(0,0,0, 0.1),Color.fromRGBO(0, 0, 0, 0.5)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                  ),
                  child: Container(height: 160,)
                ),
              Positioned(
                left: 0,
                right: 10,
                bottom: 0,
                child: ListTile(
                  title: Text(coverImages[index]["title"],style: TextStyle(
                    color: Colors.white,
                  )),
                  subtitle: Text(coverImages[index]["imageUrl"],style: TextStyle(
                    color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return SingleSeriesPhotosPage(coverImages[index]["title"]);
            }));
          },
        )
      //),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Texts.memoriesOverview,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 40,
        leading: BackButton(color: Colors.white,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: _getListData,
              itemCount: coverImages.length,
            ),
          )
        ],
      ),
    );
  }
}