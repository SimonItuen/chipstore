import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/tag_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';


class FavoriteProductTile extends StatelessWidget {
  final String thumbnailUrl;
  final String tag;
  final Color color;
  final bool hasTags;
  final VoidCallback onAddCartPressed;
  final VoidCallback onPressed;
  final VoidCallback onCheckInStorePressed;
  final bool isNotifyMe;
  const FavoriteProductTile({Key? key, required this.thumbnailUrl, required this.tag, required this.color, this.hasTags=true, required this.onAddCartPressed, required this.onCheckInStorePressed, this.isNotifyMe=false, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap:onPressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.toScreenWidth(context)),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 140.0.toScreenWidth(context),
                          padding: EdgeInsets.all(10.0.toScreenWidth(context)),
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8),
                            border: Border.all(color: Color(0XFFF8F8F8)),
                            borderRadius: BorderRadius.circular(8.0.toScreenWidth(context)),
                          ),
                          child: Image.asset(thumbnailUrl),
                        ),
                      ),
                      Positioned(
                          top: 8,
                          right: 8,
                          child:  Icon(Icons.favorite, color: Theme.of(context).primaryColor, size: 16,)),
                      Visibility(
                        visible: hasTags,
                        child: Positioned(
                          top: 8,
                            left: 0,
                            child:  TagTile(tag: tag, color: color,)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(4.0.toScreenWidth(context))),
                    Text('SwitchEasy Glass 01 Screen Protector for iPhone 11 Pro Max', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Theme.of(context).primaryColor),),
                    Padding(padding: EdgeInsets.all(2.0.toScreenWidth(context))),
                    Row(
                      children: [
                        Text('KD 9.500', style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor, decoration: TextDecoration.lineThrough), ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                        Text('50% OFF', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xFFee982c)), ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(2.0.toScreenWidth(context))),
                    Text('KD 4.750', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Theme.of(context).primaryColor),),
                    Padding(padding: EdgeInsets.all(2.0.toScreenWidth(context))),
                    isNotifyMe?
                    InkWell(
                      onTap: onAddCartPressed,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFFe188b0)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(ChipstoreAppIcons.bell, color: Colors.white, size: 13,),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                            Text('Notify Me', style: TextStyle(fontSize: 12, color: Colors.white), ),
                          ],
                        ),
                      ),
                    ):
                    InkWell(
                      onTap: onAddCartPressed,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).primaryColor
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(ChipstoreAppIcons.cart, color: Colors.white, size: 13,),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                            Text('Add to Cart', style: TextStyle(fontSize: 12, color: Colors.white), ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onCheckInStorePressed,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0.toScreenWidth(context), left: 14, bottom: 16.0.toScreenWidth(context)),
                        child: Text('Check in-store stock', style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(indent: 16,)
        ],
      ),
    );
  }
}
