import 'package:chipstore_app/screens/order/OrderDetailsInStoreScreen.dart';
import 'package:chipstore_app/screens/order/OrderDetailsScreen.dart';
import 'package:chipstore_app/screens/order/OrderDetailsSelfPickUpScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class InProgressTab extends StatefulWidget {
  const InProgressTab({Key? key}) : super(key: key);

  @override
  _InProgressTabState createState() => _InProgressTabState();
}

class _InProgressTabState extends State<InProgressTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Color(0xFFf2f6f8),
              child: Text(
                'June, 2021',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(OrderDetailsScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                          border: Border.all(color: Color(0xFFF2F2F2))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4)),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 105.0,
                              color: Theme.of(context).primaryColor,
                            ),
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
                                          color: Theme.of(context).primaryColor,
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
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child:
                                  Image.asset('assets/images/demo/iphone.png'),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Theme.of(context).primaryColor,
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
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Color(0xFFf2f6f8),
              child: Text(
                'May, 2021',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(OrderDetailsInStoreScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                          border: Border.all(color: Color(0xFFF2F2F2))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4)),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 105.0,
                              color: Theme.of(context).primaryColor,
                            ),
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
                                              color:
                                                  Theme.of(context).primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Icon(
                                          ChipstoreAppIcons.check_filled,
                                          size: 12,
                                          color: Theme.of(context).primaryColor,
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
                                          color: Theme.of(context).primaryColor,
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
                                              color:
                                                  Theme.of(context).primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Credit Card',
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).primaryColor,
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
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Image.asset('assets/images/demo/iphone.png'),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Theme.of(context).primaryColor,
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
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Image.asset('assets/images/demo/iphone.png'),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Theme.of(context).primaryColor,
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
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Color(0xFFf2f6f8),
              child: Text(
                'April, 2021',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(OrderDetailsSelfPickUpScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                          border: Border.all(color: Color(0xFFF2F2F2))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4)),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 105.0,
                              color: Theme.of(context).primaryColor,
                            ),
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
                                              color:
                                                  Theme.of(context).primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Icon(
                                          ChipstoreAppIcons.check_filled,
                                          size: 12,
                                          color: Theme.of(context).primaryColor,
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
                                          color: Theme.of(context).primaryColor,
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
                                              color:
                                                  Theme.of(context).primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Credit Card',
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).primaryColor,
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
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Image.asset('assets/images/demo/iphone.png'),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Theme.of(context).primaryColor,
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
                                  border: Border.all(color: Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Image.asset('assets/images/demo/iphone.png'),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Theme.of(context).primaryColor,
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
            ),
          ),
        ],
      ),
    );
  }
}
