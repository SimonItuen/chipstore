import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/tag_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class NewRelatedProductTile extends StatelessWidget {
  final String thumbnailUrl;
  final String tag;
  final Color color;
  final bool hasTags;
  final VoidCallback onAddCartPressed;
  final VoidCallback onCheckInStorePressed;
  final bool isNotifyMe;

  const NewRelatedProductTile(
      {Key? key,
      required this.thumbnailUrl,
      required this.tag,
      required this.color,
      this.hasTags = true,
      required this.onAddCartPressed,
      required this.onCheckInStorePressed,
      this.isNotifyMe = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0.toScreenWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 8.0.toScreenWidth(context)),
      child: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0.toScreenWidth(context)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius:
                        BorderRadius.circular(8.0.toScreenWidth(context)),
                  ),
                  child: Image.asset(thumbnailUrl),
                ),
                Padding(padding: EdgeInsets.all(4.0.toScreenWidth(context))),
                Text(
                  'SwitchEasy Glass 01 Screen Protector for iPhone 11 Pro Max',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Theme.of(context).primaryColor),
                ),
                Padding(padding: EdgeInsets.all(2.0.toScreenWidth(context))),
                Row(
                  children: [
                    Text(
                      'KD 9.500',
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    Text(
                      '50% OFF',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xFFee982c)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(2.0.toScreenWidth(context))),
                Text(
                  'KD 4.750',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Theme.of(context).primaryColor),
                ),
                Padding(padding: EdgeInsets.all(4.0.toScreenWidth(context))),
                isNotifyMe
                    ? InkWell(
                        onTap: onAddCartPressed,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xFFe188b0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                ChipstoreAppIcons.bell,
                                color: Colors.white,
                                size: 13,
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4)),
                              Text(
                                'Notify me',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: onAddCartPressed,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                ChipstoreAppIcons.cart,
                                color: Colors.white,
                                size: 13,
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4)),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                InkWell(
                  onTap: onCheckInStorePressed,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 12.0.toScreenWidth(context),
                        bottom: 32.0.toScreenWidth(context)),
                    child: Center(
                        child: Text(
                      'Check in-store stock',
                      style: TextStyle(
                          fontSize: 14,
                          color: isNotifyMe
                              ? Color(0xFF7F7F7F)
                              : Theme.of(context).primaryColor),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 8,
              right: 8,
              child: Icon(
                ChipstoreAppIcons.favorite,
                color: Theme.of(context).primaryColor,
                size: 14,
              )),
          Visibility(
            visible: hasTags,
            child: Positioned(
                top: 8,
                left: 0,
                child: TagTile(
                  tag: tag,
                  color: color,
                )),
          )
        ],
      ),
    );
  }
}
