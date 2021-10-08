import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryTimeScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryTypeScreen.dart';
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

class DeliveryLocationMapScreen extends StatefulWidget {
  static final String routeName = '/delivery-location-map';

  const DeliveryLocationMapScreen({Key? key}) : super(key: key);

  @override
  _DeliveryLocationMapScreenState createState() => _DeliveryLocationMapScreenState();
}

class _DeliveryLocationMapScreenState extends State<DeliveryLocationMapScreen> {
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
          'Delivery Location',
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
                  Card(
                      margin: EdgeInsets.all(16),
                      elevation: 0,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for your address',
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              size: 12,
                              color: Color(0xFF8c9091),
                            )),
                      )),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
getMyLocation();
                },
                child: Icon(Icons.my_location_outlined),
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 34, left: 16, right: 16),
            child: AppFilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DeliveryTypeScreen.routeName);
              },
              title: 'Confirm',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getMyLocation()async{
    final GoogleMapController controller = await _controller.future;
  LocationData myLocationData =   await _location.getLocation();
    CameraPosition _currentLocation = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(myLocationData.latitude??0.0, myLocationData.longitude??0.0),
        zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentLocation));

  }
}
