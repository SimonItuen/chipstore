import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class AccountTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final bool hasNotice;

  AccountTile({required this.onPressed, this.title='', required this.icon, this.hasNotice=false});
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap:onPressed,child: Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 40.0.toScreenWidth(context),
          height: 40.0.toScreenWidth(context),
          decoration: BoxDecoration(
              color: Color(0xFFf2f6f8), shape: BoxShape.circle),
          child: Icon(
            icon,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Expanded(
          child: Text(
            '$title',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12),
          ),
        ),
        if(hasNotice)Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              color: Color(0XFFe4002b), shape: BoxShape.circle),
        ),
        InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
            ))
      ],
    ),);
  }
}