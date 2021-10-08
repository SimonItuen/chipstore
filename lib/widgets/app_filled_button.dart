import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class AppFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;

  AppFilledButton(
      {required this.onPressed,
      this.title = '',
      this.color = const Color(0XFF005470)});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(13.0.toScreenHeight(context)),
          child: Center(
              child: Text(
            '$title',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          )),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
        ));
  }
}
