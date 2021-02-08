import 'package:chongwu/pages/PhotoViewPage.dart';
import 'package:chongwu/values/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSeriesPhotosPage extends StatelessWidget{

  final String seriesName;

  List SeriesImagesData = [
    {
      "imageUrl": "res/images/background.jpg",
      "locked": "true"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/111.jpg"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/background.jpg"
    },
    {
      "locked": "true",
      "imageUrl": "res/images/111.jpg"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/2.jpg"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/3.png"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/111.jpg"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/background.jpg"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/2.jpg"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/3.png"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/111.jpg"
    },
    {
      "locked": "false",
      "imageUrl": "res/images/background.jpg"
    },
  ];

  SingleSeriesPhotosPage(this.seriesName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(seriesName,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 40,
        leading: BackButton(color: Colors.white,),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
            ),
            itemBuilder: _getSeriesPhotosData,
            itemCount: SeriesImagesData.length,
        ),
      )
    );
  }

  Widget _getSeriesPhotosData(context,index){
    if(SeriesImagesData[index]["locked"] == "true"){
      return InkWell(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            "Locked",
            style: TextStyle(
                color: Colors.white70
            ),
          ),
        ),
        onTap: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Oops!"),
                content: Row(
                  children: <Widget>[
                    Text("你还没有解锁这张图片哦~\n努力学习吧"),
                  ],
                )
              );
            }
          );
        },
      );
    }
    else{
      return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: InkWell(
          child: Image.asset(SeriesImagesData[index]["imageUrl"],fit: BoxFit.cover,),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return PhotoViewPage(image: SeriesImagesData[index]["imageUrl"],);
            }));
          },
        )
      );
    }
  }

}