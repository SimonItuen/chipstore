import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class OrderDetailsScreen extends StatefulWidget {
  static final String routeName = '/order-details';

  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
          'Order details',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4)),
                              border: Border.all(color: Color(0xFFF2F2F2))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'CHIP01-123456789',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Icon(
                                            ChipstoreAppIcons.check_filled,
                                            size: 12,
                                            color: Color(0xFFee982c),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              'Packed',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 12,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 16),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Online (Website)',
                                              style: TextStyle(
                                                color: Color(0xFF7F7F7F),
                                                fontSize: 12,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              'June 15, 2021',
                                              style: TextStyle(
                                                color: Color(0xFF7F7F7F),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Total: KD 129.750',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Credit Card',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4)),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                )),
                            child: Row(
                              children: [
                                Container(
                                  width: 80.0.toScreenWidth(context),
                                  height: 80.0.toScreenWidth(context),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0XFFF2F2F2)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Image.asset(
                                      'assets/images/demo/iphone.png'),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Text(
                                        'KD 9999.999',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Text(
                                        'Qty: 1',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF7F7F7F),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: 48.0.toScreenWidth(context),
                          height: 48.0.toScreenWidth(context),
                          decoration: BoxDecoration(
                              color: Color(0xFFf2f6f8), shape: BoxShape.circle),
                          child: Icon(
                            ChipstoreAppIcons.truck,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Delivery options',
                                style: TextStyle(
                                    color: Color(0xFF7F7F7F), fontSize: 12),
                              ),
                              Padding(padding: EdgeInsets.all(2)),
                              Row(
                                children: [
                                  Text(
                                    'Free Delivery',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Morning (9 AM - 3 PM)',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: 48.0.toScreenWidth(context),
                          height: 48.0.toScreenWidth(context),
                          decoration: BoxDecoration(
                              color: Color(0xFFf2f6f8), shape: BoxShape.circle),
                          child: Icon(
                            ChipstoreAppIcons.location_point,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Delivery Address',
                                style: TextStyle(
                                    color: Color(0xFF7F7F7F), fontSize: 12),
                              ),
                              Padding(padding: EdgeInsets.all(2)),
                              Text(
                                'Jabriya, Block-6, Street-7, House-21',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ), Padding(padding: EdgeInsets.all(2)),
                              Text(
                                'Morning (9 AM - 3 PM)',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: 48.0.toScreenWidth(context),
                          height: 48.0.toScreenWidth(context),
                          decoration: BoxDecoration(
                              color: Color(0xFFf2f6f8), shape: BoxShape.circle),
                          child: Icon(
                            Icons.payment_outlined,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Payment',
                                style: TextStyle(
                                    color: Color(0xFF7F7F7F), fontSize: 12),
                              ),
                              Padding(padding: EdgeInsets.all(2)),
                              Row(
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12),
                                  ),
                                  Spacer(),
                                  Text(
                                    'KD 129.750',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(2)),
                              Row(
                                children: [
                                  Text(
                                    'Delivery fee',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Free',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(2)),
                              Row(
                                children: [
                                  Text(
                                    'Grand total',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Spacer(),
                                  Text(
                                    'KD 129.750',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
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
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 34.0),
            child: AppFilledButton(onPressed: (){}, title: 'Track my order',),
          )
        ],
      ),
    );
  }
}
