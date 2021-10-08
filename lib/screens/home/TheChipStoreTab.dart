import 'dart:async';
import 'dart:ui';

import 'package:chipstore_app/models/AppStatusesModel.dart';
import 'package:chipstore_app/screens/story_preview/StoryPreviewScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/widgets/app_statuses_tile.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/favorite_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TheChipStoreTab extends StatefulWidget {
  const TheChipStoreTab({Key? key}) : super(key: key);

  @override
  _TheChipStoreTabState createState() => _TheChipStoreTabState();
}

class _TheChipStoreTabState extends State<TheChipStoreTab> {
  int selectedIndex = 1;

  Completer<GoogleMapController> _controller = Completer();
  Location _location = Location();
  static final CameraPosition _kChipStore = CameraPosition(
    target: LatLng(29.33983813417865, 47.93978981840325),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
                        count: status.count,
                        coverUrl: status.coverUrl,
                        color: status.color),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                  left: 16.0.toScreenWidth(context),
                  right: 16.0.toScreenWidth(context),
                  bottom: 24.0.toScreenHeight(context)),
              child: Row(
                children: [
                  Container(
                    width: 319.0.toScreenWidth(context),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor),
                    child: Row(
                      children: [
                        Icon(
                          ChipstoreAppIcons.award,
                          color: Color(0XFFf9f871),
                          size: 24,
                        ),
                        Padding(padding: EdgeInsets.all(6)),
                        Expanded(
                            child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce feugiat, sem id consequat venenatis.',
                          maxLines: 2,
                          style:
                              TextStyle(color: Color(0xFFc9f7ff), fontSize: 10),
                        )),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: 319.0.toScreenWidth(context),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFe188b0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          ChipstoreAppIcons.award,
                          color: Color(0XFFf9f871),
                          size: 24,
                        ),
                        Padding(padding: EdgeInsets.all(6)),
                        Expanded(
                            child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce feugiat, sem id consequat venenatis.',
                          maxLines: 2,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    width: 375.0.toScreenWidth(context),
                    child: Image.asset('assets/images/demo/tc1.png')),
                Stack(
                  children: [
                    Container(
                      color: Color(0xFFF2F2F2),
                      width: double.infinity,
                      height: 24,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 343.0.toScreenWidth(context),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF000000).withOpacity(0.04),
                                blurRadius: 16,
                                spreadRadius: 0,
                                offset: Offset(0, 8))
                          ]),
                      child: Column(
                        children: [
                          Text(
                            'The New iMac with Apple M1 chip',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '8-core CPU with 4 cores and 4 efficiency cores,\n8-core GPU, and 16-core Neural Engine',
                            style: TextStyle(
                                color: Color(0xFF8c9091), fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int j = 0; j < 3; j++)
                                Container(
                                  height: 2,
                                  width: 8,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: j == selectedIndex
                                        ? Theme.of(context).primaryColor
                                        : Color(0xFF8c9091).withOpacity(0.25),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16, top: 32),
              child: Row(
                children: [
                  Text(
                    'Shop by Category',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Text(
                    'View all categories',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xFFee982c)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(
                  left: 8.0.toScreenWidth(context),
                  right: 8.0.toScreenWidth(context),
                  bottom: 32.0.toScreenWidth(context)),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 120.0.toScreenWidth(context),
                      height: 160.0.toScreenWidth(context),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 16, right: 16, left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF000000).withOpacity(0.04),
                                blurRadius: 16,
                                spreadRadius: 0,
                                offset: Offset(0, 8))
                          ]),
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/demo/tcss${i + 1}.png',
                            ),
                          ),
                          Spacer(),
                          Text(
                            i == 0
                                ? 'Featured\nDeals'
                                : i == 1
                                    ? 'Computers &\nTablets'
                                    : 'Mobile\nPhones',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Container(
              width: 375.0.toScreenWidth(context),
              height: 128.0.toScreenWidth(context),
              color: Color(0xFFf9f871),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Look what’s new in store',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                    child: Text(
                      'New arrivals in phones, computers & more.',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
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
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                      Icon(
                        ChipstoreAppIcons.arrow_forward,
                        size: 8,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 375.0.toScreenWidth(context),
                  height: 70.0.toScreenWidth(context),
                  color: Color(0xFFf9f871),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0.toScreenWidth(context)),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Container(
                          width: 140.0.toScreenWidth(context),
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.0.toScreenWidth(context)),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          10.0.toScreenWidth(context)),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              8.0.toScreenWidth(context)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xFF000000)
                                                    .withOpacity(0.04),
                                                blurRadius: 16,
                                                spreadRadius: 0,
                                                offset: Offset(0, 8))
                                          ]),
                                      child: Image.asset(
                                        'assets/images/demo/c${i + 1}.png',
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            4.0.toScreenWidth(context))),
                                    Text(
                                      'SwitchEasy Glass 01 Screen Protector for iPhone 11 Pro Max',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            2.0.toScreenWidth(context))),
                                    Row(
                                      children: [
                                        Text(
                                          'KD 9.500',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4)),
                                        Text(
                                          '50% OFF',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Color(0xFFee982c)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            2.0.toScreenWidth(context))),
                                    Text(
                                      'KD 4.750',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            4.0.toScreenWidth(context))),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              ChipstoreAppIcons.cart,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4)),
                                            Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 12.0.toScreenWidth(context),
                                          bottom: 32.0.toScreenWidth(context)),
                                      child: Center(
                                          child: Text(
                                        'Check in-store stock',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )),
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
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                  left: 16.0.toScreenWidth(context),
                  right: 16.0.toScreenWidth(context),
                  top: 16.0.toScreenHeight(context),
                  bottom: 24.0.toScreenHeight(context)),
              child: Row(
                children: [
                  Container(
                    width: 287.0.toScreenWidth(context),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Main title text comes here',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Main title text comes here',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Call to action',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                            ),
                            Icon(
                              ChipstoreAppIcons.arrow_forward,
                              size: 8,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: 287.0.toScreenWidth(context),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF9de07c)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Main title text comes here',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Main title text comes here',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Call to action',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                            ),
                            Icon(
                              ChipstoreAppIcons.arrow_forward,
                              size: 8,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ],
                    ),
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
                    'Best Sellers',
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
            Container(
              width: 375.0.toScreenWidth(context),
              height: 128.0.toScreenWidth(context),
              color: Color(0xFFe188b0),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        'Deal of the day',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(
                        Icons.hourglass_bottom_rounded,
                        size: 10,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                      Text(
                        '02:45:01',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                    child: Text(
                      'Grab it before it goes away for the day.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                      Icon(
                        ChipstoreAppIcons.arrow_forward,
                        size: 8,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 375.0.toScreenWidth(context),
                  height: 70.0.toScreenWidth(context),
                  color: Color(0xFFe188b0),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0.toScreenWidth(context)),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Container(
                          width: 140.0.toScreenWidth(context),
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.0.toScreenWidth(context)),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          10.0.toScreenWidth(context)),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              8.0.toScreenWidth(context)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xFF000000)
                                                    .withOpacity(0.04),
                                                blurRadius: 16,
                                                spreadRadius: 0,
                                                offset: Offset(0, 8))
                                          ]),
                                      child: Image.asset(
                                        'assets/images/demo/do${i % 2 + 1}.png',
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            4.0.toScreenWidth(context))),
                                    Text(
                                      'SwitchEasy Glass 01 Screen Protector for iPhone 11 Pro Max',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            2.0.toScreenWidth(context))),
                                    Row(
                                      children: [
                                        Text(
                                          'KD 9.500',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4)),
                                        Text(
                                          '50% OFF',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Color(0xFFee982c)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            2.0.toScreenWidth(context))),
                                    Text(
                                      'KD 4.750',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            4.0.toScreenWidth(context))),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              ChipstoreAppIcons.cart,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4)),
                                            Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 12.0.toScreenWidth(context),
                                          bottom: 32.0.toScreenWidth(context)),
                                      child: Center(
                                          child: Text(
                                        'Check in-store stock',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )),
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
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 4),
              child: Text(
                'Trending now',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, left: 16, right: 16, bottom: 16),
              child: Text(
                'Curated by your shopping history with us',
                style: TextStyle(fontSize: 12, color: Color(0xFF8c9091)),
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0.toScreenWidth(context)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        height: 140.0.toScreenWidth(context),
                                        padding: EdgeInsets.all(
                                            10.0.toScreenWidth(context)),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color(0XFFF2F2F2)),
                                          borderRadius: BorderRadius.circular(
                                              8.0.toScreenWidth(context)),
                                        ),
                                        child: Image.asset(
                                            'assets/images/demo/tn${i + 1}.png'),
                                      ),
                                    ),
                                    Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Icon(
                                          ChipstoreAppIcons.favorite,
                                          color: Theme.of(context).primaryColor,
                                          size: 16,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(
                                          4.0.toScreenWidth(context))),
                                  Text(
                                    'SwitchEasy Glass 01 Screen Protector for iPhone 11 Pro Max',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(
                                          2.0.toScreenWidth(context))),
                                  Row(
                                    children: [
                                      Text(
                                        'KD 9.500',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4)),
                                      Text(
                                        '50% OFF',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xFFee982c)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(
                                          2.0.toScreenWidth(context))),
                                  Text(
                                    'KD 4.750',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(
                                          2.0.toScreenWidth(context))),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 28),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color:
                                              Theme.of(context).primaryColor),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            ChipstoreAppIcons.cart,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4)),
                                          Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0.toScreenWidth(context),
                                          left: 14,
                                          bottom: 16.0.toScreenWidth(context)),
                                      child: Text(
                                        'Check in-store stock',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              ],
            ),
            Divider(),
            Container(
              width: 343.0.toScreenWidth(context),
              decoration: BoxDecoration(
                  color: Color(0xFFc9f7ff),
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 56.0.toScreenWidth(context),
                      width: 56.0.toScreenWidth(context),
                      margin: EdgeInsets.only(bottom: 24),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/gift.png'))),
                  Text(
                    'Need gift ideas? We’ve got you\ncovered.',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Gift Ideas',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          ChipstoreAppIcons.arrow_forward,
                          size: 8,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Gift Cards',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          ChipstoreAppIcons.arrow_forward,
                          size: 8,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding:
                  EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16, top: 16),
              child: Row(
                children: [
                  Text(
                    'Recently viewed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Text(
                    'View all',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xFFee982c)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.toScreenWidth(context)),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    ClearanceProduct(
                      onAddCartPressed: _showAddedToCartBottomSheet,
                      thumbnailUrl: 'assets/images/demo/c${i + 1}.png',
                      tag: '',
                      color: Colors.transparent,
                    ),
                ],
              ),
            ),
            Divider(),
            Container(
              width: 287.0.toScreenWidth(context),
              height: 216.0.toScreenWidth(context),
              padding: EdgeInsets.only(left: 16, top: 16, right: 8, bottom: 0),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Main title text comes here',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Main title text comes here',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Call to action',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          Icon(
                            ChipstoreAppIcons.arrow_forward,
                            size: 8,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                      height: 147.0.toScreenHeight(context),
                      child: Image.asset('assets/images/tcs1.png'))
                ],
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        height: 28.0.toScreenWidth(context),
                        width: 40.0.toScreenWidth(context),
                        margin: EdgeInsets.only(bottom: 16),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset('assets/images/mail.png'))),
                    Text(
                      'Get promo codes in your inbox',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                      child: Text(
                        'We won’t spam you, quality newsletter garanteed.',
                        style: TextStyle(
                          color: Color(0XFF8c9091),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return 'Email cannot be empty';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Enter email address',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ]),
            ),
            Divider(),
            Container(
              width: 343.0.toScreenWidth(context),
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 39.0.toScreenWidth(context),
                      width: 28.0.toScreenWidth(context),
                      child: Image.asset('assets/images/refer_and_earn.png')),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Refer & Earn!',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                        Text('Invite your friends and get up to 15% OFF',
                            style: TextStyle(
                              color: Color(0xFF8c9091),
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              width: 343.0.toScreenWidth(context),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Come & pay us a visit',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                  Text('Premium stores to deliver the ultimate experience',
                      style: TextStyle(
                        color: Color(0xFF8c9091),
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            Container(
              height: 340.0.toScreenHeight(context),
              child: Scaffold(
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kChipStore,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      zoomControlsEnabled: false,
                    ),
                    Positioned(
                      bottom: -60,
                      left: 0,
                      right: 0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16, left: 8, right: 8),
                        child: Row(
                          children: [
                            for (int i = 0; i < 4; i++)
                              Container(
                                width: 279.0.toScreenWidth(context),
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFF000000)
                                              .withOpacity(0.04),
                                          blurRadius: 16,
                                          spreadRadius: 0,
                                          offset: Offset(0, 8))
                                    ]),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 72.0.toScreenWidth(context),
                                          height: 72.0.toScreenWidth(context),
                                          child: Image.asset(
                                            'assets/images/demo/sl3.png',
                                            fit: BoxFit.fill,
                                          )),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                'Shuwaikh Store',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                '10:00AM - 08:00PM',
                                                style: TextStyle(
                                                    color: Color(0xFF8c9091),
                                                    fontSize: 12),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    ChipstoreAppIcons.direction,
                                                    size: 16,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4),
                                                  ),
                                                  Text(
                                                    'Get Directions',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 8,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )
                                    ]),
                              )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                            height: 80.0.toScreenWidth(context),
                            width: 80.0.toScreenWidth(context),
                            child:
                                Image.asset('assets/images/chip_pointer.png')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            child: RawMaterialButton(
                              shape: CircleBorder(),
                              onPressed: () {
                                /*getMyLocation();*/
                              },
                              child: Icon(
                                ChipstoreAppIcons.fit_to_width,
                                size: 11,
                                color: Theme.of(context).primaryColor,
                              ),
                              fillColor: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 24,
                            width: 24,
                            child: RawMaterialButton(
                              shape: CircleBorder(),
                              onPressed: () {
                                /*getMyLocation();*/
                              },
                              child: Icon(
                                ChipstoreAppIcons.my_location,
                                size: 11,
                                color: Theme.of(context).primaryColor,
                              ),
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 68.0.toScreenWidth(context),
                  left: 16,
                  right: 16,
                  bottom: 24),
              child: AppOutlinedButton(
                onPressed: () {},
                title: 'Look for items in available in store',
              ),
            ),
            Divider(),
            Container(
              width: 375.0.toScreenWidth(context),
              height: 128.0.toScreenWidth(context),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'The best brands all in one place',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
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
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                      Icon(
                        ChipstoreAppIcons.arrow_forward,
                        size: 8,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 9; i++)
                    Container(
                      width: 104.0.toScreenWidth(context),
                      height: 104.0.toScreenWidth(context),
                      margin: i % 3 == 1
                          ? EdgeInsets.only(top: 16)
                          : EdgeInsets.only(bottom: 16),
                      padding:
                          EdgeInsets.symmetric(vertical: 28, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF000000).withOpacity(0.04),
                                blurRadius: 16,
                                spreadRadius: 0,
                                offset: Offset(0, 8))
                          ]),
                      child: Center(
                        child:
                            Image.asset('assets/images/demo/tsb${i + 1}.png'),
                      ),
                    ),
                ],
              ),
            ),
            Divider(),
            Container(
              width: 375.0.toScreenWidth(context),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Browse the way you like',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 343.0.toScreenWidth(context),
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.04),
                        blurRadius: 16,
                        spreadRadius: 0,
                        offset: Offset(0, 8))
                  ]),
              padding: EdgeInsets.only(top: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          ChipstoreAppIcons.category,
                          size: 21,
                          color: Color(0XFF7F7F7F),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                        Text(
                          'By Category',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          ChipstoreAppIcons.arrow_forward,
                          size: 8,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    indent: 58,
                    endIndent: 0,
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          ChipstoreAppIcons.power,
                          size: 21,
                          color: Color(0XFF7F7F7F),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                        Text(
                          'By Power Type',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          ChipstoreAppIcons.arrow_forward,
                          size: 8,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    indent: 58,
                    endIndent: 0,
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          ChipstoreAppIcons.brands,
                          size: 21,
                          color: Color(0XFF7F7F7F),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                        Text(
                          'By Brands',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          ChipstoreAppIcons.arrow_forward,
                          size: 8,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              width: 343.0.toScreenWidth(context),
              padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 12),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24),
                    child: Text(
                      'Need help with something?',
                      style: TextStyle(
                          color: Color(0XFFc9f7ff),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 32.0.toScreenWidth(context),
                                    width: 32.0.toScreenWidth(context),
                                    child: Image.asset(
                                        'assets/images/tsn${i + 1}.png')),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                ),
                                Text(
                                  'Speak to a customer representative',
                                  style: TextStyle(
                                    color: Color(0XFFc9f7ff),
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Book an appointment',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      Icon(
                        ChipstoreAppIcons.arrow_forward,
                        size: 8,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top:8, bottom: 16),
                height: 48.0.toScreenWidth(context),
                width: 48.0.toScreenWidth(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF008da9),
                        Theme.of(context).primaryColor
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.25),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: Offset(0, 8))
                    ]),
                child: Icon(
                  Icons.margin,
                  color: Colors.white,
                ),
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
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
