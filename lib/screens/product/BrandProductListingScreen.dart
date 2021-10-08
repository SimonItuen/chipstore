import 'package:chipstore_app/screens/bar_code_scanner/BarCodeScannerScreen.dart';
import 'package:chipstore_app/screens/cart/CartScreen.dart';
import 'package:chipstore_app/screens/global_filter/GlobalFilterScreen.dart';
import 'package:chipstore_app/screens/product/CompareProductsScreen.dart';
import 'package:chipstore_app/screens/product/ProductListingSecondScreen.dart';
import 'package:chipstore_app/screens/search_screen/SearchScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/favorite_product_tile.dart';
import 'package:chipstore_app/widgets/new_related_product_tile.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class BrandProductListingScreen extends StatefulWidget {
  const BrandProductListingScreen({Key? key}) : super(key: key);
  static final String routeName = '/brand-product-listing';

  @override
  _BrandProductListingScreenState createState() =>
      _BrandProductListingScreenState();
}

class _BrandProductListingScreenState extends State<BrandProductListingScreen> {
  bool isListView = false;
  List<String> category = ['Devices', 'Cases', 'Cables'];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 215.0.toScreenHeight(context),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/images/demo/adidas.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(padding: const EdgeInsets.all(8.0)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '@adidaskw',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    'Adidas Kuwait',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      left: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ProductListingSecondScreen.routeName);
                                },
                                child: Text(
                                  '12,000 results',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isListView = !isListView;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      ChipstoreAppIcons.view,
                                      size: 12,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4)),
                                    Text(
                                      'View',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _showSortByBottomSheet();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      ChipstoreAppIcons.sort,
                                      size: 12,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4)),
                                    Text(
                                      'Sort by',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(GlobalFilterScreen.routeName);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      ChipstoreAppIcons.filter,
                                      size: 12,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4)),
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)))),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xFFF2F2F2),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex=i;
                              });
                            },
                            child: Container(
                              margin: i==1?EdgeInsets.symmetric(horizontal: 12):EdgeInsets.zero,
                              padding:
                                  EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: i == selectedIndex
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFd9d9d9)),
                                  color: i == selectedIndex
                                      ? Theme.of(context).primaryColor
                                      : Colors.white),
                              child: Text(
                                '${category[i]}',
                                style: i == selectedIndex
                                    ? TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)
                                    : TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                              ),
                            ),
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
                isListView
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0; i < 3; i++)
                                FavoriteProductTile(
                                  onPressed:(){},
                                  onAddCartPressed: () {},
                                  onCheckInStorePressed: () {
                                    _showCheckInStoreBottomSheet();
                                  },
                                  thumbnailUrl: 'assets/images/demo/f${i + 1}.png',
                                  tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                                  color: i % 2 == 0
                                      ? Color(0xFFe188b0)
                                      : Color(0xFFee982c),
                                )
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.spaceAround,
                            clipBehavior: Clip.none,
                            children: [
                              for (int i = 0; i < 4; i++)
                                NewRelatedProductTile(
                                  onAddCartPressed: i == 1
                                      ? () {
                                          _showBackInStockNotificationBottomSheet();
                                        }
                                      : () {},
                                  onCheckInStorePressed: () {
                                    _showCheckInStoreBottomSheet();
                                  },
                                  thumbnailUrl: 'assets/images/demo/case${i}.png',
                                  tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                                  isNotifyMe: i == 1,
                                  color: i % 2 == 0
                                      ? Color(0xFFe188b0)
                                      : Color(0xFFee982c),
                                ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Color(0xFFF2F2F2),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 98.0.toScreenHeight(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                )
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showCompareBottomSheet();
        },
        label: Text('Compare'),
        icon: Icon(Icons.filter),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                                        horizontal: 4.0),
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
                          Navigator.of(context)
                              .pushNamed(CompareProductsScreen.routeName);
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
