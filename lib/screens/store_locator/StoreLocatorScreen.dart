import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/cart/DeliveryLocationMapScreen.dart';
import 'package:chipstore_app/screens/store_locator/StoreDetailsScreen.dart';
import 'package:chipstore_app/screens/store_locator/StoreLocationMapViewScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StoreLocatorScreen extends StatefulWidget {
  static final String routeName = '/store-locator';

  const StoreLocatorScreen({Key? key}) : super(key: key);

  @override
  _StoreLocatorScreenState createState() => _StoreLocatorScreenState();
}

class _StoreLocatorScreenState extends State<StoreLocatorScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          'Store Locator',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(StoreLocationMapViewScreen.routeName);
              },
              icon: Icon(
                ChipstoreAppIcons.map,
                color: Theme.of(context).primaryColor,
                size: 16,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xFFF2F2F2),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(ChipstoreAppIcons.person_location,
                      size: 18, color: Theme.of(context).primaryColor),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Turn on precise location',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2),
                        ),
                        Text('Access in-store tools and more!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 10)),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: Text('Turn on',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 10)),
                    ),
                  ),
                ],
              ),
            ),
            for(int i=0; i<2; i++)
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 148.0.toScreenHeight(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/demo/stl$i.jpg',
                            fit: BoxFit.fill,
                          ))),
                  Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFF2F2F2)),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Chips Store',
                            style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                          ),
                          Text(
                            'Jabriya Branch',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      ChipstoreAppIcons.clock,
                                      size: 16,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                    ),
                                    Text(
                                      'Open until 8:00 PM',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      ChipstoreAppIcons.phone_call,
                                      size: 16,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                    ),
                                    Text(
                                      '+965 22255512',
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
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                ChipstoreAppIcons.location_point,
                                size: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                              ),
                              Text(
                                'Block-6, Street-7, Al-Sahara Complex, Shop no.12',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(StoreDetailsScreen.routeName);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    ChipstoreAppIcons.get_directions,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                  Text(
                                    'Get Directions',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
