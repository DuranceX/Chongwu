import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class PhotoViewPage extends StatelessWidget{
  const PhotoViewPage({
    this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: InkWell(
        child: Container(
          color: Colors.black,
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: ExtendedImage(
            image: AssetImage(image),
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state){
              return GestureConfig(
                minScale: 0.8,
                animationMinScale: 0.7,
                maxScale: 3.0,
                animationMaxScale: 3.5,
                speed: 1.0,
              );
            },
          ),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      )
    );
  }
}