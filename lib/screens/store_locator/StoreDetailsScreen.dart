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

class StoreDetailsScreen extends StatefulWidget {
  static final String routeName = '/store-details';

  const StoreDetailsScreen({Key? key}) : super(key: key);

  @override
  _StoreDetailsScreenState createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
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
          'Store Details',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
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
              body: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kChipStore,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                zoomControlsEnabled: false,
              ),
            ),
          ),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
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
                                padding: EdgeInsets.symmetric(horizontal: 4),
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
                                padding: EdgeInsets.symmetric(horizontal: 4),
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
                          /*Navigator.of(context)
                                    .pushNamed(StoreLocatorScreen.routeName);*/
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
                              padding: EdgeInsets.symmetric(horizontal: 4),
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
                  ])),
          Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 24,bottom: 64),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: 64.0.toScreenWidth(context),
                                height: 64.0.toScreenWidth(context),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  ChipstoreAppIcons.schedule,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                'Schedule an\nappointment',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: 64.0.toScreenWidth(context),
                                height: 64.0.toScreenWidth(context),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  ChipstoreAppIcons.customer_care,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                'Call the\nstore',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ])),
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
