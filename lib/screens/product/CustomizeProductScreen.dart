import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/screens/cart/CartScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/new_related_product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class CustomizeProductScreen extends StatefulWidget {
  const CustomizeProductScreen({Key? key}) : super(key: key);
  static final String routeName = '/customize-product';

  @override
  _CustomizeProductScreenState createState() => _CustomizeProductScreenState();
}

class _CustomizeProductScreenState extends State<CustomizeProductScreen> {
  bool isListView = false;
  TextEditingController textController = TextEditingController();
  int selectedIndex = 1;
  int selectedRam = 1;
  int selectedStorage = 1;
  int selectedColor = 1;
  List<Color> colorList = [
    Color(0xFF000000),
    Color(0xFFF2F2F2),
    Color(0xFF5f4d80),
    Color(0xFF143168),
    Color(0xFF366424),
    Color(0xFFff43a5),
    Color(0xFFff0019),
    Color(0xFFfa6826),
    Color(0xFFf4ce11),
    Color(0xFFf9d4d1),
    Color(0xFFf7f4ca),
    Color(0xFFb9dec6),
    Color(0xFFcae8ea),
    Color(0xFFffc3d0),
    Color(0xFF7F7F7F),
    Color(0xFF9d32f3),
    Color(0xFF21d2ff),
    Color(0xFF005470)
  ];
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
          'Customize',
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
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 16, right: 16),
                    child: Row(
                      children: [
                        Text(
                          'Text',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          '(${textController.text.length}/8 Characters)',
                          style:
                              TextStyle(color: Color(0xFFa6a6a6), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      controller: textController,
                      inputFormatters: [LengthLimitingTextInputFormatter(8)],
                      onChanged: (val) {
                        setState(() {});
                      },
                      validator: (val) {
                        return null;
                      },
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 8, bottom: 0),
                    child: Text(
                      'Layout:',
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < storage.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedStorage = i;
                              });
                            },
                            child: Container(
                              margin: i != 0 && i != storage.length - 1
                                  ? EdgeInsets.symmetric(horizontal: 12)
                                  : EdgeInsets.zero,
                              width: 64.0.toScreenWidth(context),
                              height: 64.0.toScreenWidth(context),
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: i == selectedStorage
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFd9d9d9)),
                                  color: Colors.white),
                              child: Align(
                                alignment: i==0?Alignment.centerRight:i==1?Alignment.bottomCenter:Alignment.center,
                                child: i==0?RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    'TT',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ):i==storage.length-1?Text(
                                  'TT\nTT',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ):Text(
                                  'TT',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 8, bottom: 0),
                    child: Text(
                      'Font:',
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < ram.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedRam = i;
                              });
                            },
                            child: Container(
                              margin: i != 0 && i != ram.length - 1
                                  ? EdgeInsets.symmetric(horizontal: 12)
                                  : EdgeInsets.zero,
                              width: 64.0.toScreenWidth(context),
                              height: 64.0.toScreenWidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: i == selectedRam
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFd9d9d9)),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 8, bottom: 0),
                    child: Text(
                      'Color:',
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: Wrap(
                      children: [
                        for (int i = 0; i < colorList.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedColor = i;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              height: 40.0.toScreenWidth(context),
                              width: 40.0.toScreenWidth(context),
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: i == selectedColor
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFF2F2F2)),
                                  color: Colors.white),
                              child: ClipRRect(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: colorList[i],
                                          shape: BoxShape.circle))),
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
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 16,
                    ),
                    child: AppFilledButton(
                      onPressed: () {Navigator.of(context).pop();},
                      title: 'Done',
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
