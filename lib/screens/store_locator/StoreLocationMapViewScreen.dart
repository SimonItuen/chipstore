import 'dart:ui';

import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryTimeScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryTypeScreen.dart';
import 'package:chipstore_app/screens/store_locator/StoreLocatorScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/account_tile.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class StoreLocationMapViewScreen extends StatefulWidget {
  static final String routeName = '/store-location-map-view';

  const StoreLocationMapViewScreen({Key? key}) : super(key: key);

  @override
  _StoreLocationMapViewScreenState createState() =>
      _StoreLocationMapViewScreenState();
}

class _StoreLocationMapViewScreenState
    extends State<StoreLocationMapViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible = false;
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
                Navigator.of(context).maybePop();
              },
              icon: Icon(
                ChipstoreAppIcons.list,
                color: Theme.of(context).primaryColor,
                size: 11,
              ))
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
            child: Scaffold(
              body: Stack(
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
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16))),
                      constraints: BoxConstraints(
                          minHeight: 0,
                          maxHeight: 164.0.toScreenHeight(context)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 4),
                                  child: Text(
                                    'Stores in Kuwait',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                SingleChildScrollView(
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
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                                    width: 72.0
                                                        .toScreenWidth(context),
                                                    height: 72.0
                                                        .toScreenWidth(context),
                                                    child: Image.asset(
                                                      'assets/images/demo/sl3.png',
                                                      fit: BoxFit.fill,
                                                    )),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12,
                                                        vertical: 4),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          'Shuwaikh Store',
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          '10:00AM - 08:00PM',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF8c9091),
                                                              fontSize: 12),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 4),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              ChipstoreAppIcons
                                                                  .direction,
                                                              size: 16,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4),
                                                            ),
                                                            Text(
                                                              'Get Directions',
                                                              style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4),
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 8,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                )
                                              ]),
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 164.0.toScreenHeight(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          getMyLocation();
                        },
                        child: Icon(
                          ChipstoreAppIcons.my_location,
                          size: 20,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getMyLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData myLocationData = await _location.getLocation();
    CameraPosition _currentLocation = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(
            myLocationData.latitude ?? 0.0, myLocationData.longitude ?? 0.0),
        zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentLocation));
  }

  void _showStoreSheet() async {
    showBottomSheet<void>(
        context: context,
        backgroundColor: Colors.white.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              constraints: BoxConstraints(
                  minHeight: 0, maxHeight: 164.0.toScreenHeight(context)),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4),
                          child: Text(
                            'Stores in Kuwait',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16, left: 8, right: 8),
                          child: Row(
                            children: [
                              for (int i = 0; i < 4; i++)
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(children: [
                                    Image.asset('assets/images/demo/sl3.png')
                                  ]),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
