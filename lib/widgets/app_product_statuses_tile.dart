import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:chipstore_app/extensions/app_extensions.dart';

class AppProductStatusesTile extends StatelessWidget {
  final String title;
  final int count;
  final String coverUrl;
  final Color color;

  const AppProductStatusesTile(
      {Key? key,
      required this.title,
      required this.count,
      required this.coverUrl,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.0.toScreenWidth(context),
      height: 92.0.toScreenHeight(context),
      margin: EdgeInsets.symmetric(horizontal: 12.0.toScreenWidth(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.toScreenHeight(context)),
            child: Container(
              width: 52.0.toScreenWidth(context),
              height: 52.0.toScreenWidth(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:Colors.white,),
              child: Image.asset(
                '$coverUrl',
              ),
            ),
          ),
          Text(title, textAlign: TextAlign.center,maxLines: 2, style: TextStyle(fontSize: 10, color: Theme.of(context).primaryColor),),
        ],
      ),
    );
  }
}
