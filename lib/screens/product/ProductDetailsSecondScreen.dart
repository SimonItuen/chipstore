import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/screens/cart/CartScreen.dart';
import 'package:chipstore_app/screens/product/CustomizeProductScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/new_related_product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductDetailsSecondScreen extends StatefulWidget {
  const ProductDetailsSecondScreen({Key? key}) : super(key: key);
  static final String routeName = '/product-details-second';

  @override
  _ProductDetailsSecondScreenState createState() =>
      _ProductDetailsSecondScreenState();
}

class _ProductDetailsSecondScreenState
    extends State<ProductDetailsSecondScreen> {
  bool isListView = false;
  int selectedIndex = 1;
  int selectedRam = 1;
  int selectedStorage = 1;
  int selectedColor = 1;
  List<String> ram = ['8GB', '16GB', '32GB', '64GB'];
  List<String> storage = ['64GB', '128GB', '256GB', '512GB'];

  List<String> statusList = [
    'Deal of\nthe day',
    'iPhones\nXs',
    'iPhones\nXr',
    'iPhones\n11',
    'iPhones\n12'
  ];
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
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
          'Product Name',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
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
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 16, bottom: 16),
                    height: 375.0.toScreenWidth(context),
                    width: 375.0.toScreenWidth(context),
                    decoration: BoxDecoration(color: Colors.white),
                    child: PageView(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Image.asset('assets/images/demo/c1.png')
                      ],
                      onPageChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int j = 0; j < 3; j++)
                        Container(
                          height: 2,
                          width: 8,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: j == selectedIndex
                                ? Theme.of(context).primaryColor
                                : Color(0xFF8c9091).withOpacity(0.25),
                          ),
                        )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Text(
                      'Evo Clear for Apple iPhone 12/12 Pro - Clear',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 4, bottom: 4),
                    child: Text(
                      'Model: THH-00035  •  SKU: 6428997  •  Release: 10/13/2020',
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 4, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          'KD 9.500',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                        Text(
                          '50% OFF',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFFee982c)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 0, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          'Color:',
                          style:
                              TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                        Text(
                          'Transparent',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedColor = i;
                              });
                            },
                            child: Container(
                              margin: i != 0 && i != 4 - 1
                                  ? EdgeInsets.symmetric(horizontal: 12)
                                  : EdgeInsets.zero,
                              height: 80.0.toScreenWidth(context),
                              width: 80.0.toScreenWidth(context),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: i == selectedColor
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFd9d9d9)),
                                  color: Colors.white),
                              child: Image.asset('assets/images/demo/c1.png'),
                            ),
                          )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Icon(
                      ChipstoreAppIcons.customize,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Customize',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pushNamed(CustomizeProductScreen.routeName);
                              });
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color: Theme.of(context).primaryColor,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 24, left: 16, right: 16),
                    child: Text(
                      'Style the way you like! Select a custom layout, font, text and color to match your style and outfit.',
                      style: TextStyle(
                          color: Color(0xFF7F7F7F), fontSize: isEdit ? 16 : 12),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: AppOutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: 'Buy Now',
                        )),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                        Expanded(
                            child: AppFilledButton(
                          onPressed: () {},
                          title: 'Add to cart',
                        )),
                      ],
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
