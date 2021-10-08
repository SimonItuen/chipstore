import 'package:chipstore_app/screens/bar_code_scanner/BarCodeScannerScreen.dart';
import 'package:chipstore_app/screens/cart/CartScreen.dart';
import 'package:chipstore_app/screens/home/ClearanceTab.dart';
import 'package:chipstore_app/screens/home/FeaturedTab.dart';
import 'package:chipstore_app/screens/home/TheChipStoreTab.dart';
import 'package:chipstore_app/screens/search_screen/SearchScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 5);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(SearchScreen.routeName);
          },
          child: AbsorbPointer(
            absorbing: true,
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search for items, brands, deals',
                  hintStyle: TextStyle(fontSize: 12, color: Color(0XFFA6A6A6)),
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
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicator: AppTabIndicator(
                      indicatorHeight: 3,
                      indicatorColor: Theme.of(context).primaryColor,
                      indicatorSize: AppTabIndicatorSize.normal),
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                  //For Selected tab//For Un-selected Tabs
                  unselectedLabelStyle: TextStyle(
                      color: Color(0xFFA6A5A4),
                      fontSize: 12,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(
                      text: 'THE CHIPS STORE',
                    ),
                    Tab(
                      text: 'FEATURED',
                    ),
                    Tab(
                      text: 'SALE',
                    ),
                    Tab(
                      text: 'CLEARANCE',
                    ),
                    Tab(
                      text: 'BLOG',
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Color(0XFFF2F2F2),
                )
              ],
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(
                ChipstoreAppIcons.cart,
                color: Theme.of(context).primaryColor,
                size: 20,
              ))
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TheChipStoreTab(),
          FeaturedTab(),
          Container(),
          ClearanceTab(),
          Container(),
        ],
      ),
    );
  }
}