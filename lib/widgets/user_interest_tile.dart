import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class UserInterestTile extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  UserInterestTile(
      {this.thumbnailUrl = '',
      this.title = '',
      required this.onPressed,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  '$thumbnailUrl',
                  width: 96.0.toScreenWidth(context),
                  height: 96.0.toScreenWidth(context),
                ),
                Visibility(
                  visible: isSelected,
                  child: Container(
                    width: 96.0.toScreenWidth(context),
                    height: 96.0.toScreenWidth(context),
                    child: Icon(ChipstoreAppIcons.check, color: Colors.white,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Theme.of(context).primaryColor.withOpacity(0.5), Theme.of(context).primaryColor],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
    );
  }
}
