import 'package:chipstore_app/models/AppStatusesModel.dart';
import 'package:chipstore_app/screens/story_preview/StoryPreviewScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/widgets/app_statuses_tile.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class ClearanceTab extends StatefulWidget {
  const ClearanceTab({Key? key}) : super(key: key);

  @override
  _ClearanceTabState createState() => _ClearanceTabState();
}

class _ClearanceTabState extends State<ClearanceTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0.toScreenWidth(context),
                  vertical: 24.0.toScreenHeight(context)),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (AppStatusesModel status in demoStatusList)
                    AppStatusesTile(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(StoryPreviewScreen.routeName);
                        },
                        title: '${status.title}',
                        count: status.count,
                        coverUrl: status.coverUrl,
                        color: status.color),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
              child: Row(
                children: [
                  Text(
                    'Mobile cases & covers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xFFee982c)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: 8.0.toScreenWidth(context)),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    ClearanceProduct(
                      onAddCartPressed: _showAddedToCartBottomSheet,
                      thumbnailUrl: 'assets/images/demo/c${i + 1}.png',
                      tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                      color: i % 2 == 0 ? Color(0xFFe188b0) : Color(0xFFee982c),
                    ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
              child: Row(
                children: [
                  Text(
                    'Watch bands',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xFFee982c)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: 8.0.toScreenWidth(context)),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    ClearanceProduct(
                        onAddCartPressed: _showAddedToCartBottomSheet,
                        thumbnailUrl: 'assets/images/demo/c${i + 1}.png',
                        tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                        color:
                            i % 2 == 0 ? Color(0xFFe188b0) : Color(0xFFee982c),
                        hasTags: false),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  void _showAddedToCartBottomSheet() async {
    int imageSelectedAsDp = -1;
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(
                            ChipstoreAppIcons.check_filled,
                            color: Color(0XFF9de07c),
                            size: 22,
                          ),
                          Padding(padding: EdgeInsets.all(6)),
                          Text(
                            'Item has been added to your cart!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(12)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0.toScreenWidth(context),
                            height: 80.0.toScreenWidth(context),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.circular(4)),
                            child: Image.asset('assets/images/demo/iphone.png'),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apple iPad Pro (2020) 12.9-inch 256GB Wifi - Space gray',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  'KD 320.500',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  'KD 9999.999',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(12)),
                    Container(
                      color: Color(0xFFF2F2F2),
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            'Cart total',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Spacer(),
                          Text(
                            'KD 9999.999',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(12)),
                    Padding(
                      padding:
                          EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
                      child: Row(
                        children: [
                          Text(
                            'Frequently bought together',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.toScreenWidth(context)),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 4; i++)
                            ClearanceProduct(
                              onAddCartPressed: _showAddedToCartBottomSheet,
                              thumbnailUrl: 'assets/images/demo/c${i + 1}.png',
                              tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                              color: i % 2 == 0
                                  ? Color(0xFFe188b0)
                                  : Color(0xFFee982c),
                            ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: AppOutlinedButton(
                            onPressed: () {},
                            title: 'Continue Shopping',
                          )),
                          Padding(padding: EdgeInsets.all(8)),
                          Expanded(
                              child: AppFilledButton(
                            onPressed: () {},
                            title: 'Checkout',
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
