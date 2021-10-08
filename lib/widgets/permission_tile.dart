import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  PermissionTile({ this.title='', this.description='', required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        Padding(padding: EdgeInsets.all(8)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '$title',
                style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
              ),
              Padding(padding: EdgeInsets.all(2)),
              Text(
                '$description',
                style: TextStyle(fontSize: 12, color: Color(0XFF666666), fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],),
    );
  }
}
