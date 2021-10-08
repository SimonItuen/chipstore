import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class OrderDetailsInStoreScreen extends StatefulWidget {
  static final String routeName = '/order-details-in-store';

  const OrderDetailsInStoreScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsInStoreScreenState createState() =>
      _OrderDetailsInStoreScreenState();
}

class _OrderDetailsInStoreScreenState extends State<OrderDetailsInStoreScreen> {
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
                                            color: Color(0XFF9de07c),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              'Delivered',
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
                                              'In-store (Shuwaikh branch)',
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
                                            'Total: KD 15.50',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Cash',
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
                                      'assets/images/demo/icard.png'),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Apple iTunes gift card 100\$ (US store)',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                    Text(
                                      'KD 15.50',
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
                                    Padding(padding: EdgeInsets.all(8)),
                                    InkWell(
                                      onTap: () {
                                        _showCodeBottomSheet();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Show code',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
        ],
      ),
    );
  }

  void _showCodeBottomSheet() async {
    int selectedTile = 0;
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              constraints: BoxConstraints(
                  minHeight: 0, maxHeight: 733.0.toScreenHeight(context)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Digital Card details',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black.withOpacity(0.4),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Apple iTunes gift card 100\$ (U.S. Store)',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 20),
                    ),
                    Container(
                      width: 327.0.toScreenWidth(context),
                      height: 327.0.toScreenWidth(context),
                      margin: EdgeInsets.symmetric(vertical: 24),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFF2F2F2)),
                          borderRadius: BorderRadius.circular(4)),
                      child: Image.asset('assets/images/demo/icard.png'),
                    ),
                    Padding(padding: EdgeInsets.all(12)),
                    Text(
                      'Code',
                      style: TextStyle(fontSize: 12, color: Color(0xFF7F7F7F)),
                    ),
                    Text(
                      'x89w6kdyMlyk2k50',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(12)),
                    Text(
                      'Serial no.',
                      style: TextStyle(fontSize: 12, color: Color(0xFF7F7F7F)),
                    ),
                    Text(
                      'ITNC\$0502101121009',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(12)),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: AppOutlinedButton(
                            onPressed: () {},
                            title: 'Share',
                          )),
                          Spacer(),
                          Expanded(
                              child: AppFilledButton(
                            onPressed: () {},
                            title: 'Copy Code',
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
