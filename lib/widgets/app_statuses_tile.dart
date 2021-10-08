import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:chipstore_app/extensions/app_extensions.dart';

class AppStatusesTile extends StatelessWidget {
  final String title;
  final int count;
  final String coverUrl;
  final Color color;
  final VoidCallback onPressed;

  const AppStatusesTile(
      {Key? key,
      required this.title,
        required this.onPressed,
      required this.count,
      required this.coverUrl,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 56.0.toScreenWidth(context),
        height: 92.0.toScreenHeight(context),
        margin: EdgeInsets.symmetric(horizontal: 12.0.toScreenWidth(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.toScreenHeight(context)),
              child: DottedBorder(
                strokeWidth: 1,
                color: color,
                strokeCap: StrokeCap.butt,
                borderType: BorderType.Circle,
                dashPattern: [((math.pi*(52.0.toScreenWidth(context))+2)/count)-1,count!=1?(10/count):0
                ],
                child: Container(
                  width: 52.0.toScreenWidth(context),
                  height: 52.0.toScreenWidth(context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0XFF008da9),
                            Theme.of(context).primaryColor,
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      '$coverUrl',
                    ),
                  ),
                ),
              ),
            ),
            Text(title, textAlign: TextAlign.center,maxLines: 2, style: TextStyle(fontSize: 10, color: Theme.of(context).primaryColor),),
          ],
        ),
      ),
    );
  }
}
