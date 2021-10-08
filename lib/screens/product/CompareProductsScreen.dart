import 'package:chipstore_app/screens/bar_code_scanner/BarCodeScannerScreen.dart';
import 'package:chipstore_app/screens/cart/CartScreen.dart';
import 'package:chipstore_app/screens/search_screen/SearchScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/favorite_product_tile.dart';
import 'package:chipstore_app/widgets/new_related_product_tile.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CompareProductsScreen extends StatefulWidget {
  const CompareProductsScreen({Key? key}) : super(key: key);
  static final String routeName = '/compare-products';

  @override
  _CompareProductsScreenState createState() => _CompareProductsScreenState();
}

class _CompareProductsScreenState extends State<CompareProductsScreen> {
  bool isListView = true;
  ScrollController controller = ScrollController();
  bool hasScrolledToTop = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if (controller.offset <= controller.position.minScrollExtent &&
          !controller.position.outOfRange) {
        setState(() {
          hasScrolledToTop = true;
        });
      } else {
        setState(() {
          hasScrolledToTop = false;
        });
      }
      print(hasScrolledToTop);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            ChipstoreAppIcons.close,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          'Compare products',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                child: Icon(
                  ChipstoreAppIcons.cart,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                )),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Visibility(
              visible: hasScrolledToTop,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AbsorbPointer(
                  absorbing: true,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search for anything',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Color(0XFFA6A6A6)),
                        fillColor: Color(0XFF8C9091).withOpacity(0.1),
                        filled: true,
                        contentPadding: EdgeInsets.only(left: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(BarCodeScannerScreen.routeName);
                          },
                          icon: Icon(
                            ChipstoreAppIcons.qr_code,
                            color: Theme.of(context).primaryColor,
                            size: 16,
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: hasScrolledToTop
                ? 180.0.toScreenHeight(context)
                : 128.0.toScreenHeight(context),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 140.0.toScreenWidth(context),
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0.toScreenWidth(context)),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                        10.0.toScreenWidth(context)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8.0.toScreenWidth(context)),
                                    ),
                                    child: Image.asset(
                                        'assets/images/demo/f${2}.png'),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(
                                          4.0.toScreenWidth(context))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'SwitchEasy Glass 01 Screen Protector for iPhone 11 Pro Max',
                                      maxLines: hasScrolledToTop?3:2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.all(8),
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
                                            'Add to Cart',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  child: Center(
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: Colors.white,
                                      size: 8,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFE00000)),
                                ),
                              ),
                            ),
                            /*Visibility(
                              visible: false,
                              child: Positioned(
                                  top: 8,
                                  left: 0,
                                  child:  TagTile(tag: tag, color: color,)),
                            )*/
                          ],
                        ),
                      ),
                      Container(
                        width: 140.0.toScreenWidth(context),
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0.toScreenWidth(context)),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                        10.0.toScreenWidth(context)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8.0.toScreenWidth(context)),
                                    ),
                                    child: Image.asset(
                                        'assets/images/demo/f${1}.png'),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(
                                          4.0.toScreenWidth(context))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'SwitchEasy Glass 01 Screen Protector for iPhone 11 Pro Max',
                                      maxLines: hasScrolledToTop?3:2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.all(8),
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
                                            'Add to Cart',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  child: Center(
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: Colors.white,
                                      size: 8,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFE00000)),
                                ),
                              ),
                            ),
                            /*Visibility(
                              visible: false,
                              child: Positioned(
                                  top: 8,
                                  left: 0,
                                  child:  TagTile(tag: tag, color: color,)),
                            )*/
                          ],
                        ),
                      ),
                      Container(
                        width: 79.0.toScreenWidth(context),
                        height: 180.0.toScreenHeight(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: DottedBorder(
                            dashPattern: [4,4],
                            strokeWidth: 1,
                            color: Colors.grey,
                            child: Center(child: Icon(Icons.add, size: 16,color: Colors.grey,)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Table(
                    defaultColumnWidth: IntrinsicColumnWidth(),
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      TableRow(children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 40.0.toScreenHeight(context)),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          color: Color(0xFFD9D9D9),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 40.0.toScreenHeight(context)),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(
                                  'KD 9.500',
                                  style: TextStyle(
                                      color: Color(0XFF8c9091),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  'KD 4.750',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          color: Color(0xFFF2F2F2),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 40.0.toScreenHeight(context)),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'KD 4.750',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              )),
                          color: Color(0xFFF2F2F2),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 40.0.toScreenHeight(context)),
                          padding: EdgeInsets.all(12),
                          child: Text(''),
                          color: Color(0xFFF2F2F2),
                        ),
                      ])
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 12),
                    child: Text(
                      'Specifications',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Voice\nAssistant\nBuilt-in',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Google\nAssistant',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Siri',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Voice\nAssistant\nBuilt-in',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Google\nAssistant',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Siri',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Voice\nAssistant\nBuilt-in',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Google\nAssistant',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Siri',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Wireless\nTechnology',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '5G',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '4G LTE',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Operating\nSystem',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'IOS 14',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'IOS 13',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Internal\nMemory',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '256 GB',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '128 GB',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 50.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Screen Size',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '5.81 Inches',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '6.1 Inches',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Water\nResistant',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Bluetooth\nEnable',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),

                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Voice\nAssistant\nBuilt-in',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Google\nAssistant',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Siri',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Voice\nAssistant\nBuilt-in',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              color: Color(0xFFD9D9D9),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Google\nAssistant',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Siri',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              color: Color(0xFFF2F2F2),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 40.0.toScreenHeight(context)),
                              padding: EdgeInsets.all(12),
                              child: Text(''),
                              color: Color(0xFFF2F2F2),
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSortByBottomSheet() async {
    int selectedIndex = 0;
    List<String> sortList = [
      'Best Selling',
      'Price Low to High',
      'Price High to Low',
      'Customer Rating',
      'New Arrivals',
      'Brand A-Z',
      'Brand Z-A'
    ];
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
              padding: EdgeInsets.symmetric(vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            'Sort by',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Color(0xFFe188b0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < sortList.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = i;
                              });
                            },
                            child: Row(
                              children: [
                                Radio(
                                    value: i,
                                    groupValue: selectedIndex,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedIndex = value as int;
                                      });
                                    }),
                                Text(
                                  '${sortList[i]}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                )
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  void _showFilterBottomSheet() async {
    List<String> selectedFilters = [];
    List<String> brandList = [
      'Apple',
      'Black Berry',
      'Casper',
      'Denski',
      'Energy',
      'Fulgy'
    ];
    List<String> colorList = [
      'Black',
      'Blue',
      'Red',
      'Yellow',
      'Green',
      'Purple'
    ];
    bool hasExpanded = true;
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              constraints:
                  BoxConstraints(maxHeight: 668.0.toScreenHeight(context)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Color(0xFFe188b0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xFFF2F2F2)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 12, bottom: 12),
                            child: Row(
                              children: [
                                Text(
                                  'Selected filter',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    selectedFilters.clear();
                                    setState(() {});
                                  },
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                        color: Color(0xFFe188b0),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Color(0xFFF2F2F2),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, right: 0.0, top: 16, bottom: 16),
                            child: selectedFilters.isEmpty
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        'You have no filters applied yet ',
                                        style: TextStyle(
                                            color: Color(0xFF7F7F7F),
                                            fontSize: 12),
                                      ),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: Row(
                                      children: [
                                        for (String filter in selectedFilters)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Chip(
                                              label: Text(
                                                '$filter',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              deleteIcon: Icon(
                                                ChipstoreAppIcons.close,
                                                size: 9,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              onDeleted: () {},
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xFFF2F2F2))),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ListTileTheme(
                          dense: true,
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 12),
                            childrenPadding: EdgeInsets.zero,
                            collapsedBackgroundColor: Color(0xFFf2f6f8),
                            collapsedIconColor: Theme.of(context).primaryColor,
                            title: Text(
                              'Brand',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            children: [
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Color(0xFFF2F2F2),
                              ),
                              for (String brand in brandList)
                                InkWell(
                                  onTap: () {
                                    if (!selectedFilters.contains('$brand')) {
                                      selectedFilters.add('$brand');
                                      setState(() {});
                                    } else {
                                      selectedFilters.remove('$brand');
                                      setState(() {});
                                    }
                                  },
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          value: selectedFilters
                                              .contains('$brand'),
                                          tristate: true,
                                          onChanged: (value) {},
                                        ),
                                        Text(
                                          '$brand',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                            onExpansionChanged: (val) {
                              setState(() {
                                hasExpanded = !hasExpanded;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xFFF2F2F2))),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ListTileTheme(
                          dense: true,
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 12),
                            childrenPadding: EdgeInsets.zero,
                            collapsedBackgroundColor: Color(0xFFf2f6f8),
                            collapsedIconColor: Theme.of(context).primaryColor,
                            title: Text(
                              'Color',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            children: [
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Color(0xFFF2F2F2),
                              ),
                              for (String color in colorList)
                                InkWell(
                                  onTap: () {
                                    if (!selectedFilters.contains('$color')) {
                                      selectedFilters.add('$color');
                                      setState(() {});
                                    } else {
                                      selectedFilters.remove('$color');
                                      setState(() {});
                                    }
                                  },
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          value: selectedFilters
                                              .contains('$color'),
                                          tristate: true,
                                          onChanged: (value) {},
                                        ),
                                        Text(
                                          '$color',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                            onExpansionChanged: (val) {
                              setState(() {
                                hasExpanded = !hasExpanded;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xFFF2F2F2))),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ListTileTheme(
                          dense: true,
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 12),
                            childrenPadding: EdgeInsets.zero,
                            collapsedBackgroundColor: Color(0xFFf2f6f8),
                            collapsedIconColor: Theme.of(context).primaryColor,
                            title: Text(
                              'Price',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            children: [
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Color(0xFFF2F2F2),
                              ),
                              for (String brand in brandList)
                                InkWell(
                                  onTap: () {
                                    if (!selectedFilters.contains('$brand')) {
                                      selectedFilters.add('$brand');
                                      setState(() {});
                                    } else {
                                      selectedFilters.remove('$brand');
                                      setState(() {});
                                    }
                                  },
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          value: selectedFilters
                                              .contains('$brand'),
                                          tristate: true,
                                          onChanged: (value) {},
                                        ),
                                        Text(
                                          '$brand',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                            onExpansionChanged: (val) {
                              setState(() {
                                hasExpanded = !hasExpanded;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xFFF2F2F2))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.symmetric(horizontal: 12),
                              childrenPadding: EdgeInsets.zero,
                              collapsedBackgroundColor: Color(0xFFf2f6f8),
                              collapsedIconColor:
                                  Theme.of(context).primaryColor,
                              title: Text(
                                'Compatibility',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              children: [
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Color(0xFFF2F2F2),
                                ),
                                for (String brand in brandList)
                                  InkWell(
                                    onTap: () {
                                      if (!selectedFilters.contains('$brand')) {
                                        selectedFilters.add('$brand');
                                        setState(() {});
                                      } else {
                                        selectedFilters.remove('$brand');
                                        setState(() {});
                                      }
                                    },
                                    child: AbsorbPointer(
                                      absorbing: true,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            value: selectedFilters
                                                .contains('$brand'),
                                            tristate: true,
                                            onChanged: (value) {},
                                          ),
                                          Text(
                                            '$brand',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                              onExpansionChanged: (val) {
                                setState(() {
                                  hasExpanded = !hasExpanded;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void _showCheckInStoreBottomSheet() async {
    int selectedIndex = 0;
    List<String> sortList = [
      'Best Selling',
      'Price Low to High',
      'Price High to Low',
      'Customer Rating',
      'New Arrivals',
      'Brand A-Z',
      'Brand Z-A'
    ];
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
              padding: EdgeInsets.symmetric(vertical: 24),
              constraints: BoxConstraints(
                  minHeight: 0, maxHeight: 724.0.toScreenHeight(context)),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4),
                            child: Row(
                              children: [
                                Text(
                                  'Check Store Availability',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        color: Color(0xFFe188b0),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Color(0xFFF2F2F2),
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < 8; i++)
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = i;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Radio(
                                              value: i,
                                              groupValue: selectedIndex,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedIndex = value as int;
                                                });
                                              }),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 16)),
                                              Text(
                                                'Al Hamra Mall',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                'Kuwait City, Sharq, Al Hamra Mall, Shop:B011',
                                                style: TextStyle(
                                                  color: Color(0xFF7F7F7F),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                'Store hours: Open today - 10 AM to 8 AM',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4)),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    color: i < 4
                                                        ? Color(0xFF9de07c)
                                                        : Color(0xFFe4002b),
                                                    size: 8,
                                                  ),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4)),
                                                  Text(
                                                    'In stock',
                                                    style: TextStyle(
                                                      color: Color(0xFF7F7F7F),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      indent: 16,
                                    )
                                  ],
                                )
                            ],
                          )
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
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 16, left: 16, right: 16),
                    child: AppFilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _showBackInStockNotificationBottomSheet();
                      },
                      title: 'Add to cart',
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void _showBackInStockNotificationBottomSheet() async {
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
              padding: EdgeInsets.symmetric(vertical: 24),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            'Get notified when it\'s back in stock',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close,
                                color: Color(0xFF7F7F7F), size: 14),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24.0, right: 24.0, bottom: 24.0, top: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'Email cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'Enter your email address',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 12),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24),
                          child: Text(
                            'By entering your info you agree to Chips privacy notice & terms of use.',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16, left: 16, right: 16),
                      child: AppFilledButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        title: 'Send me a notification',
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void _showCompareBottomSheet() async {
    int selectedIndex = 0;
    List<String> sortList = [
      'Best Selling',
      'Price Low to High',
      'Price High to Low',
      'Customer Rating',
      'New Arrivals',
      'Brand A-Z',
      'Brand Z-A'
    ];
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
              padding: EdgeInsets.symmetric(vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            'Compare products',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(
                                  color: Color(0xFFe188b0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16, left: 8, right: 8),
                      child: Row(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Expanded(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: 73.0.toScreenHeight(context),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: Color(0XFFF2F2F2))),
                                    child: i == 0
                                        ? Image.asset(
                                            'assets/images/demo/f${2}.png')
                                        : Container(),
                                  ),
                                  if (i == 0)
                                    Positioned(
                                      right: 0,
                                      top: -4,
                                      /*top: -(MediaQuery.of(context).size.width *0.083333 * 0.35),
                                    right: -(MediaQuery.of(context).size.width *0.083333 * 0.35),*/
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 16.0.toScreenWidth(context),
                                          height: 16.0.toScreenWidth(context),
                                          child: Icon(
                                            ChipstoreAppIcons.close,
                                            color: Colors.white,
                                            size: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFE00000),
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: AppFilledButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        title: 'Compare',
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
