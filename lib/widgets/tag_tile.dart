import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'dart:math' as Math;

class TagTile extends StatelessWidget {
  final String tag;
  final Color color;
  const TagTile({Key? key, required this.tag, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20.0.toScreenWidth(context),
          decoration: ShapeDecoration(
            color: color,
            shape: BannerBorder(),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left:4,right: 4),
          child:Container(child: Text('$tag', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),)),
        ),
        Container(
          height: 20.0.toScreenWidth(context),
          alignment: Alignment.center,
          padding:EdgeInsets.only(left:4,right: 4),
          child:Container(child: Text('$tag', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),)),
        ),
      ],
    );
  }
}

class BannerBorder extends ShapeBorder {
  final bool usePadding;

  BannerBorder({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding? 0 : 0);


  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft-Offset(2,0), rect.bottomRight);
    return Path()
      ..addRRect(RRect.fromRectAndCorners(rect, topLeft: Radius.circular(4), topRight: Radius.circular(4), bottomRight: Radius.circular(4), bottomLeft: Radius.circular(0)))
      ..moveTo(rect.bottomLeft.dx+2 , rect.bottomLeft.dy)
      ..arcTo(Rect.fromCenter(center: Offset(rect.bottomLeft.dx+2, rect.bottomLeft.dy), width: 4, height: 4),Math.pi, -(Math.pi/2),  false)
      ..close();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft-Offset(2,0), rect.bottomRight);
    return Path()
      ..addRRect(RRect.fromRectAndCorners(rect, topLeft: Radius.circular(4), topRight: Radius.circular(4), bottomRight: Radius.circular(4), bottomLeft: Radius.circular(0)))
      ..moveTo(rect.bottomLeft.dx+2 , rect.bottomLeft.dy)
      ..arcTo(Rect.fromCenter(center: Offset(rect.bottomLeft.dx+2, rect.bottomLeft.dy), width: 4, height: 4),Math.pi, -(Math.pi/2),  false)
      ..close();
  }


  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
