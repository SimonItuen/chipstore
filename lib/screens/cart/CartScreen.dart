import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/LoginScreen.dart';
import 'package:chipstore_app/screens/account/RegisterScreen.dart';
import 'package:chipstore_app/screens/cart/CouponsScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryLocationMapScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryLocationSearchScreen.dart';
import 'package:chipstore_app/screens/cart/NewAddressScreen.dart';
import 'package:chipstore_app/screens/cart/OrderConfirmationScreen.dart';
import 'package:chipstore_app/screens/cart/PersonalizeProductNameScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/account_tile.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/widgets/circle_thumb_shape.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/new_related_product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static final String routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double value = 0.2;
  int quantity = 99;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            ChipstoreAppIcons.close,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Cart',
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
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(bottom: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: Row(
                    children: [
                      Text(
                        'Standard Delivery (2)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'KD 15.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 10),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Add KD 5 for ',
                          ),
                          TextSpan(
                              text: 'FREE ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(text: 'delivery!'),
                        ]),
                  ),
                ),
                Padding(padding: EdgeInsets.all(6)),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF9de07c),
                      inactiveTrackColor: Colors.black.withOpacity(0.25),
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 2.0,
                      thumbColor: Color(0xFF9de07c),
                      thumbShape: CircleThumbShape(thumbRadius: 4),
                      overlayColor: Color(0xFF9de07c).withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 12.0),
                    ),
                    child: Slider(
                        value: value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                          });
                        }))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, right: 16, left: 16),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0XFFF2F2F2)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              quantity--;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                            child: Icon(
                                              Icons.remove_rounded,
                                              size: 14,
                                              color:
                                                  Theme.of(context).primaryColor,
                                            ),
                                          )),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                            child: Icon(
                                              Icons.add_rounded,
                                              size: 14,
                                              color:
                                                  Theme.of(context).primaryColor,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Move to wishlist',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Text('|',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor)),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Remove',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Icon(
                                  ChipstoreAppIcons.gift,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'FREE GIFT with purchase',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Apple - Free Apple Music for 6 months (New subscribers only)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF7F7F7F),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              'FREE',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF7F7F7F),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Apple - Free Apple Music for 6 months (New subscribers only)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF7F7F7F),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              'FREE',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF7F7F7F),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              indent: 16,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed(DeliveryLocationSearchScreen.routeName);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Icon(
                                    ChipstoreAppIcons.truck,
                                    size: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Deliver to my location',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Icon(Icons.arrow_forward_ios,
                                                size: 8,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Delivery available to most areas',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF7F7F7F),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              indent: 16,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Icon(
                                  ChipstoreAppIcons.gift_wrap,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Gifting options',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 8,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Get your item wrapped in fancy paper & ribbon',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              indent: 16,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Icon(
                                  ChipstoreAppIcons.shop,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Shop related accessories',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 8,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Add related accessories to stylize your item',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, right: 16, left: 16),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0XFFF2F2F2)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child:  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              quantity--;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                            child: Icon(
                                              Icons.remove_rounded,
                                              size: 14,
                                              color:
                                              Theme.of(context).primaryColor,
                                            ),
                                          )),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                            Theme.of(context).primaryColor),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                            child: Icon(
                                              Icons.add_rounded,
                                              size: 14,
                                              color:
                                              Theme.of(context).primaryColor,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Move to wishlist',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Text('|',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor)),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Remove',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap:(){
                              Navigator.of(context).pushNamed(NewAddressScreen.routeName);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Icon(
                                    ChipstoreAppIcons.shop,
                                    size: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Store pick up',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Icon(Icons.arrow_forward_ios,
                                                size: 8,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Pick up item from ',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF7F7F7F),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Avenue Mall',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              indent: 16,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Icon(
                                  ChipstoreAppIcons.gift_wrap,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Gifting options',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                  ChipstoreAppIcons
                                                      .check_filled,
                                                  size: 16,
                                                  color: Color(0XFF9de07c)),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5)),
                                              Icon(Icons.arrow_forward_ios,
                                                  size: 8,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap:(){
                                        Navigator.of(context).pushNamed(PersonalizeProductNameScreen.routeName);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(top: 8.0, right:16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color(0XFFF2F2F2)),
                                                    borderRadius:
                                                        BorderRadius.circular(4)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 56.0
                                                          .toScreenWidth(context),
                                                      width: 56.0
                                                          .toScreenWidth(context),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0XFFF2F2F2)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: ClipRRect(borderRadius:
                                                      BorderRadius
                                                          .circular(4),
                                                        child: Image.asset(
                                                            'assets/images/demo/gw1.jpg'),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:12.0),
                                                        child: Text(
                                                          'Happy Birthday\nMohammed! Wish you all the best  🎁 😊',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Theme.of(context).primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 56.0
                                                          .toScreenWidth(context),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children:[
                                                          Text('KD 1.00',style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 12,
                                                              color: Theme
                                                                  .of(context)
                                                                  .primaryColor),),
                                                          Text('Edit',style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 10,
                                                              color: Color(0xFFe188b0)),),
                                                        ]
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, right: 16, left: 16),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0XFFF2F2F2)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child:  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              quantity--;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                            child: Icon(
                                              Icons.remove_rounded,
                                              size: 14,
                                              color:
                                              Theme.of(context).primaryColor,
                                            ),
                                          )),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                            Theme.of(context).primaryColor),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                            child: Icon(
                                              Icons.add_rounded,
                                              size: 14,
                                              color:
                                              Theme.of(context).primaryColor,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Move to wishlist',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Text('|',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor)),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Remove',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Icon(
                                  ChipstoreAppIcons.shop,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Store pick up',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 8,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Pick up item from ',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF7F7F7F),
                                                  ),
                                                ),
                                                Text(
                                                  'Avenue Mall',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              indent: 16,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Icon(
                                  ChipstoreAppIcons.gift_wrap,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Gifting options',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 8,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Get your item wrapped in fancy paper & ribbon',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 16.0, left: 16.0, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              'New or related products',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          SingleChildScrollView(
                            clipBehavior: Clip.none,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.toScreenWidth(context)),
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal: BorderSide(
                                          color: Color(0xFFF2F2F2)))),
                              child: Row(
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: NewRelatedProductTile(
                                            onAddCartPressed: () {},
                                            onCheckInStorePressed: (){},
                                            thumbnailUrl:
                                                'assets/images/demo/ca${(i % 2) + 1}.png',
                                            tag: i % 2 == 0
                                                ? 'NEW'
                                                : 'BESTSELLER',
                                            color: i % 2 == 0
                                                ? Color(0xFFe188b0)
                                                : Color(0xFFee982c),
                                          ),
                                        ),
                                        Container(
                                          color: Color(0xFFF2F2F2),
                                          height: 340,
                                          width: 1,
                                        )
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
                  Card(
                      margin: EdgeInsets.all(16),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          onTap: (){
                            FocusScope.of(context).requestFocus(new FocusNode());
                            Navigator.of(context).pushNamed(CouponsScreen.routeName);
                          },
                          enableInteractiveSelection: false,
                          showCursor: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Coupon code',
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor),
                              suffixIcon: TextButton(
                                  child: Text(
                                    'APPLY',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  onPressed: () {})),
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
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
                  Container(
                      color: Theme.of(context).primaryColor,
                      child: InkWell(
                        onTap:(){
                          Navigator.of(context).pushNamed(OrderConfirmationScreen.routeName);
                        },
                        child: Card(
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 34),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13.0, horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  'Proceed to checkout',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Spacer(),
                                Text(
                                  '10.000 KWD',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
