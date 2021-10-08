import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  AppOutlinedButton({required this.onPressed, this.title=''});
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap:onPressed,child: Container( width: double.infinity,padding:EdgeInsets.all(13.0.toScreenHeight(context)),child: Center(child: Text('$title', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.w600),)), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Theme.of(context).primaryColor,), borderRadius: BorderRadius.circular(4)),));
  }
}