import 'package:chipstore_app/screens/product/BrandProductListingScreen.dart';
import 'package:chipstore_app/screens/product/CelebrityProductListingScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Explore',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.none,
              children: [
                Icon(
                  ChipstoreAppIcons.cart,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Positioned(
                  top: 12,
                  right: -10,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: Text(
                        '99',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: 16.0, left: 16.0, bottom: 8, top: 24),
                    child: Text(
                      'Trending',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Text(
                      'Checkout what’s the trending in Kuwait.',
                      style: TextStyle(fontSize: 12, color: Color(0xFF8c9091)),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 8.0.toScreenWidth(context),
                        right: 8.0.toScreenWidth(context),
                        top: 16,
                        bottom: 32),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 2; i++)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  CelebrityProductListingScreen.routeName);
                            },
                            child: Container(
                              width: 224.0.toScreenWidth(context),
                              height:
                                  (120 / 224) * 224.0.toScreenWidth(context),
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      'assets/images/demo/et${1}.png')),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 16.0, left: 16.0, bottom: 8, top: 24),
                    child: Text(
                      'Insta wonders',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Text(
                      'Saw something awesome on instagram shop for it here.',
                      style: TextStyle(fontSize: 12, color: Color(0xFF8c9091)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xFFee982c)),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                        Icon(
                          ChipstoreAppIcons.arrow_forward,
                          color: Color(0xFFee982c),
                          size: 8,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 432.0.toScreenWidth(context),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          left: 8.0.toScreenWidth(context),
                          right: 8.0.toScreenWidth(context),
                          top: 8,
                          bottom: 8),
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          for (int i = 0; i < 24; i++)
                            Container(
                              width: 120.0.toScreenWidth(context),
                              height: 120.0.toScreenWidth(context),
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      'assets/images/demo/em${(i % 6) + 1}.png')),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                            )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 16.0, left: 16.0, bottom: 8, top: 24),
                    child: Text(
                      'New & upcoming',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Text(
                      'Newly added product that our customers are loving!',
                      style: TextStyle(fontSize: 12, color: Color(0xFF8c9091)),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 8.0.toScreenWidth(context),
                        right: 8.0.toScreenWidth(context),
                        top: 16,
                        bottom: 32),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 2; i++)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  BrandProductListingScreen.routeName);
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 240.0.toScreenWidth(context),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 240.0.toScreenWidth(context),
                                      height: 240.0.toScreenWidth(context),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          child: Image.asset(
                                              'assets/images/demo/eb${1}.png')),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Special VR event by Chips',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4),
                                          ),
                                          Text(
                                            'Register today & get notified',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF8c9091)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
