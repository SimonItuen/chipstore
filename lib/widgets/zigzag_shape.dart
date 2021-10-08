import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZigZagShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color(0XFF005470);

    var path = Path();
    double subWidth = 0;
    while(subWidth <=size.width){
      print('$subWidth, 0');
      print('${subWidth +5}, 5');
      path.lineTo(subWidth , 5);
      path.lineTo(subWidth + 5 , 0);
      subWidth += 10;
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}