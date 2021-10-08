import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class SearchTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isLast;

  SearchTile({required this.onPressed, this.title='', this.isLast=false});
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap:onPressed,child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('$title', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize:14,color: Theme.of(context).primaryColor,),),
              Spacer(),
              Icon(ChipstoreAppIcons.arrow_forward, color: Theme.of(context).primaryColor, size: 11,)
            ],
          ),
          if(!isLast)Divider()
        ],
      ),
    ),);
  }
}