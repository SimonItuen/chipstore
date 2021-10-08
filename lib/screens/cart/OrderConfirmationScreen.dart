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

class OrderConfirmationScreen extends StatefulWidget {
  static final String routeName = '/order-confirmation';

  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible = false;
  int selectedIndex = 1;

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
          'Payment',
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
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Delivery Address',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Change',
                              style: TextStyle(
                                color: Color(0xFFee982c),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Area: Jabriya',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4)),
                                  Text(
                                    'Block-6, Street-7, Building-29, Floor-0, Flat-3',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4)),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4)),
                                  Text(
                                    '+965 94073404',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4)),
                                ],
                              ),
                            ),
                            Container(
                                width: 100.0.toScreenWidth(context),
                                height: 100.0.toScreenWidth(context),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/demo/map.JPG',
                                      fit: BoxFit.fill,
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Payment Options',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: selectedIndex == 0
                                    ? Border.all(
                                        color: Theme.of(context).primaryColor)
                                    : Border.all(color: Color(0xFFF2F2F2))),
                            child: Row(
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
                                  child: Text(
                                    'Credit Card',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                                SizedBox(
                                  height: 24,
                                  width: 34,
                                  child: Image.asset(
                                    'assets/images/visa.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                                SizedBox(
                                  height: 24,
                                  width: 34,
                                  child: Image.asset(
                                    'assets/images/mastercard.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: selectedIndex == 1
                                    ? Border.all(
                                        color: Theme.of(context).primaryColor)
                                    : Border.all(color: Color(0xFFF2F2F2))),
                            child: Row(
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
                                  child: Text(
                                    'KNET',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                                SizedBox(
                                  height: 24,
                                  width: 34,
                                  child: Image.asset(
                                    'assets/images/knet.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: selectedIndex == 2
                                    ? Border.all(
                                        color: Theme.of(context).primaryColor)
                                    : Border.all(color: Color(0xFFF2F2F2))),
                            child: Row(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: selectedIndex,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedIndex = value as int;
                                      });
                                    }),
                                Expanded(
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                                SizedBox(
                                  height: 24,
                                  width: 34,
                                  child: Image.asset(
                                    'assets/images/cash.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: selectedIndex == 3
                                    ? Border.all(
                                        color: Theme.of(context).primaryColor)
                                    : Border.all(color: Color(0xFFF2F2F2))),
                            child: Row(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: selectedIndex,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedIndex = value as int;
                                      });
                                    }),
                                Expanded(
                                  child: Text(
                                    'Generate payment link',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                                SizedBox(
                                  height: 24,
                                  width: 34,
                                  child: Image.asset(
                                    'assets/images/payment_link.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4)),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Cart Summary',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 56.0.toScreenWidth(context),
                              width: 56.0.toScreenWidth(context),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child:
                                  Image.asset('assets/images/demo/iphone.png'),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Apple',
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Color(0XFF7F7F7F),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'iPhone 12 mini 5.4-inch display blue sim free 256 GB ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'KD 320.500',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF8c9091),
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
                                ]),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 64,
                            ),
                            Text(
                              'Blue • 256 GB • 1 year warranty',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0XFF7F7F7F),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Qty: 1',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0XFF7F7F7F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFF2F2F2)),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 56.0.toScreenWidth(context),
                            width: 56.0.toScreenWidth(context),
                            padding: EdgeInsets.all(8),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0XFFF2F2F2)),
                                    borderRadius: BorderRadius.circular(2)),
                                child: ClipRRect(borderRadius: BorderRadius.circular(2),
                                    child: Image.asset(
                                        'assets/images/demo/gw1.jpg'))),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit…',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:16.0),
                            child: Text(
                              'KD 1.000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 56.0.toScreenWidth(context),
                              width: 56.0.toScreenWidth(context),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Image.asset('assets/images/demo/c1.png'),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Apple',
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Color(0XFF7F7F7F),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'iPhone 12 mini 5.4-inch display blue sim free 256 GB ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'KD 320.500',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF8c9091),
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
                                ]),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 64,
                            ),
                            Text(
                              'Blue • 256 GB • 1 year warranty',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0XFF7F7F7F),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Qty: 1',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0XFF7F7F7F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 56.0.toScreenWidth(context),
                              width: 56.0.toScreenWidth(context),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Image.asset('assets/images/demo/c2.png'),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Apple',
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Color(0XFF7F7F7F),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'iPhone 12 mini 5.4-inch display blue sim free 256 GB ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'KD 320.500',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF8c9091),
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
                                ]),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 64,
                            ),
                            Text(
                              'Blue • 256 GB • 1 year warranty',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0XFF7F7F7F),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Qty: 1',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0XFF7F7F7F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Order Summary',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                      color: Color(0xFFF2F2F2),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Padding(padding: EdgeInsets.all(4)),
                                    Text(
                                      '1 item',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xFF8c9091)),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  'KD 320.05',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(4)),
                            Row(
                              children: [
                                Text(
                                  'Delivery fee',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Spacer(),
                                Text(
                                  'FREE',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(6)),
                            Row(
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Spacer(),
                                Text(
                                  'KD 320.500',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 34, right: 16, left: 16.0),
                    child: AppFilledButton(
                      onPressed: () {},
                      title: 'Proceed to Payment',
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
