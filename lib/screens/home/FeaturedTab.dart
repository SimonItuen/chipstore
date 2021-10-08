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

class FeaturedTab extends StatefulWidget {
  const FeaturedTab({Key? key}) : super(key: key);

  @override
  _FeaturedTabState createState() => _FeaturedTabState();
}

class _FeaturedTabState extends State<FeaturedTab> {
  int selectedIndex = 1;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        count: 0,
                        coverUrl: status.coverUrl,
                        color: Colors.transparent),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
              child: Text(
                'Shop by Category',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
                width: 343.0.toScreenWidth(context),
                margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset('assets/images/demo/fe1.png'))),
            Container(
              width: 343.0.toScreenWidth(context),
              margin: EdgeInsets.only(right: 16, left: 16),
              padding:
                  EdgeInsets.only(top: 12, bottom: 24, left: 12, right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color(0xFF000000).withOpacity(0.04),blurRadius: 16, spreadRadius: 0,  offset: Offset(0, 8))
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          height: 116.0.toScreenWidth(context),
                          width: 98.0.toScreenWidth(context),
                          decoration: BoxDecoration(
                              color: i == 0
                                  ? Color(0xFFefe5ff)
                                  : i == 1
                                      ? Color(0xFFe2f4de)
                                      : Color(0xFFaecbdb),
                              borderRadius: BorderRadius.circular(4)),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 80.0.toScreenWidth(context),
                              height: 80.0.toScreenWidth(context),
                              child: Image.asset(
                                'assets/images/demo/fes${i + 1}.png',
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:16.0, bottom: 12),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(color: Color(0xFF8c9091), fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Icon(
                        ChipstoreAppIcons.arrow_forward,
                        size: 7,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < 3; j++)
                    Container(
                      height: 2,
                      width: 8,
                      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: j == selectedIndex
                            ? Theme.of(context).primaryColor
                            : Color(0xFF8c9091).withOpacity(0.25),
                      ),
                    )
                ],
              ),
            ),
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
