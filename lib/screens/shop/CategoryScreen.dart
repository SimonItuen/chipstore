import 'package:chipstore_app/screens/bar_code_scanner/BarCodeScannerScreen.dart';
import 'package:chipstore_app/screens/home/ClearanceTab.dart';
import 'package:chipstore_app/screens/search_screen/SearchScreen.dart';
import 'package:chipstore_app/screens/shop/ElectronicsTab.dart';
import 'package:chipstore_app/screens/shop/ElectronicsTwoTab.dart';
import 'package:chipstore_app/screens/shop/SubCategoryListScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShopScreen extends StatefulWidget {
  static final String routeName = '/shop';

  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 4);
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
        title: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(SubCategoryListScreen.routeName);
          },
          child: Text(
            'Shop by category',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Theme.of(context).primaryColor),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.none,
              children: [
                Icon(
                  ChipstoreAppIcons.cart,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Positioned(
                  top: 17,
                  right: -10,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: Text(
                        '99',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
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
                      text: 'ELECTRONICS',
                    ),
                    Tab(
                      text: 'ACCESSORIES',
                    ),
                    Tab(
                      text: 'OTHER PRODUCTS',
                    ),
                    Tab(
                      text: 'BRAND',
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Color(0XFFF2F2F2),
                )
              ],
            )),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ElectronicsTab(),
          ElectronicsTwoTab(),
          Container(),
          Container(),

        ],
      ),
    );
  }
}
