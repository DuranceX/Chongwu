// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class PopRoute extends PopupRoute {
//   final Duration _duration = Duration(milliseconds: 200);
//   Widget child;
//
//   PopRoute({@required this.child});
//
//   ///弹出蒙层的颜色，null则为透明
//   @override
//   Color get barrierColor => null;
//
//   @override
//   bool get barrierDismissible => true;
//
//   @override
//   String get barrierLabel => null;
//
//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return child;
//   }
//
//   @override
//   Duration get transitionDuration => _duration;
// }
//
// class PopupMenuTestPage extends StatefulWidget{
//   PopupMenuTestPageState createState()=> PopupMenuTestPageState();
// }
//
// class PopupMenuTestPageState extends State<PopupMenuTestPage>{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("PopupMenuTestPage"),
//         actions: <Widget>[
//           FlatButton(onPressed: (){}, child: Icon(Icons.build))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class OverlayDemo1 extends StatefulWidget {
  @override
  _OverlayDemo1State createState() => _OverlayDemo1State();
}

class _OverlayDemo1State extends State<OverlayDemo1> {
  OverlayEntry _overlayEntry;
  int current = 0;
  final buttonRowKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OverlayDemo1"),
      ),
      body: Column(
        children: [
          Row(
              key: buttonRowKey,
              children: List.generate(
                3,
                    (i) => RaisedButton(
                  onPressed: () {
                    final index = i + 1;
                    if (current == index) {
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                      current = 0;
                      return;
                    }
                    current = index;
                    _overlayEntry?.remove();
                    final box = buttonRowKey.currentContext.findRenderObject() as RenderBox;
                    final dy = box.localToGlobal(Offset(0, box.size.height)).dy;
                    _overlayEntry = OverlayEntry(
                        builder: (context) => Positioned.fill(
                          top: dy,
                          child: Material(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Container(
                                  color: Theme.of(context).backgroundColor,
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints.expand(height: 500),
                                  child: Text("menu$index"),
                                ),
                                Expanded(child: GestureDetector(onTap: () {
                                  _overlayEntry.remove();
                                  _overlayEntry = null;
                                  current = 0;
                                })),
                              ],
                            ),
                          ),
                        ));
                    Overlay.of(context).insert(_overlayEntry);
                  },
                  child: Text("menu${i + 1}"),
                ),
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }
}