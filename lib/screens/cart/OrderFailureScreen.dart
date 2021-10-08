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

class OrderFailureScreen extends StatefulWidget {
  static final String routeName = '/order-failure';

  const OrderFailureScreen({Key? key}) : super(key: key);

  @override
  _OrderFailureScreenState createState() => _OrderFailureScreenState();
}

class _OrderFailureScreenState extends State<OrderFailureScreen> {
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
          'Something went wrong',
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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 72.0, bottom: 56, left: 24, right: 24),
                      child: Container(
                          child: Center(
                        child: Image.asset('assets/images/error.png'),
                      ))),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Oops! Something went wrong',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 47.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat eleifend ligula, a tincidunt lectus accumsan et. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppFilledButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(OrderSuccessScreen.routeName);
                      },
                      title: 'Retry',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Cancel',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
