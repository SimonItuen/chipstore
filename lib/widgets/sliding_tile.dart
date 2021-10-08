import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SlidingTile extends StatelessWidget {
  final bool isActive;

  SlidingTile({this.isActive=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 2,
      width: 12,
      decoration: BoxDecoration(
        color: isActive?Colors.white: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }
}
