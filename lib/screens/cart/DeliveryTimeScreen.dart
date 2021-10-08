import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/account_tile.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class DeliveryTimeScreen extends StatefulWidget {
  static final String routeName = '/delivery-time';

  const DeliveryTimeScreen({Key? key}) : super(key: key);

  @override
  _DeliveryTimeScreenState createState() => _DeliveryTimeScreenState();
}

class _DeliveryTimeScreenState extends State<DeliveryTimeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  int selectedIndex = -1;

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
          'Delivery Time',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Color(0xFFF2F2F2),
            value: 2 / 4,
            minHeight: 1,
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF9de07c)),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'When do you want us to deliver?',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(12)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      width: 343.0.toScreenWidth(context),
                      padding: EdgeInsets.only(
                          bottom: 16, right: 16, top: 10, left: 10),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : Color(0XFFF2F2F2)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                              value: 0,
                              groupValue: selectedIndex,
                              onChanged: (value) {
                                setState(() {
                                  selectedIndex = value as int;
                                });
                              }),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(6)),
                                Icon(
                                  ChipstoreAppIcons.morning,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('In the morning',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14)),
                                ),
                                RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF7F7F7F),
                                          fontFamily: 'OpenSans',
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'Our delivery driver will\ncome between ',
                                        ),
                                        TextSpan(
                                            text: '9 AM to 12 PM',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      width: 343.0.toScreenWidth(context),
                      padding: EdgeInsets.only(
                          bottom: 16, right: 16, top: 10, left: 10),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Color(0XFFF2F2F2)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                              value: 1,
                              groupValue: selectedIndex,
                              onChanged: (value) {
                                setState(() {
                                  selectedIndex = value as int;
                                });
                              }),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(6)),
                                Icon(
                                  ChipstoreAppIcons.night,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('In the evening',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14)),
                                ),
                                RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF7F7F7F),
                                          fontFamily: 'OpenSans',
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'Our delivery driver will\ncome between ',
                                        ),
                                        TextSpan(
                                            text: '1 PM to 10 PM',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 34, left: 16, right: 16),
            child: AppFilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              title: 'Confirm',
            ),
          ),
        ],
      ),
    );
  }
}
