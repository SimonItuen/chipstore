import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LanguageChangeTile extends StatelessWidget {
  final String flagUrl;
  final String title;
  final VoidCallback onPressed;

  LanguageChangeTile({this.flagUrl='', this.title='', required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 32),
        child: Row(children: [
          Image.asset(
            '$flagUrl',
            width: 40,
            height: 40,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '$title',
                style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
              )),
        ],),
      ),
    );
  }
}
