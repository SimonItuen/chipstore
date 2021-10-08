import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/cart/OrderSuccessScreen.dart';
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

class ContactUsSuccessScreen extends StatefulWidget {
  static final String routeName = '/contact-us-success';

  const ContactUsSuccessScreen({Key? key}) : super(key: key);

  @override
  _ContactUsSuccessScreenState createState() => _ContactUsSuccessScreenState();
}

class _ContactUsSuccessScreenState extends State<ContactUsSuccessScreen> {
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: 250.0.toScreenHeight(context), bottom: 56, left: 24, right: 24),
                      child: Container(
                        width: 80.0.toScreenWidth(context),
                          child: Center(
                        child: Image.asset('assets/images/success.png'),
                      ))),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Your message was\nsuccessfully sent',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 47.0),
                    child: Text(
                      'Thank you for your message. One of our customer representative agents will get back to your within 48 hours',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0,bottom: 34.0,),
            child: AppFilledButton(
              onPressed: () {
                Navigator.of(context)
                    .pop();
              },
              title: 'Okay',
            ),
          ),
        ],
      ),
    );
  }
}
