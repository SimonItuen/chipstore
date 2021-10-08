import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/global_filter/AllGlobalFilterTab.dart';
import 'package:chipstore_app/screens/global_filter/MyProductsGlobalFilterTab.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/account_tile.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/widgets/app_tab_indicator.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class GlobalFilterScreen extends StatefulWidget {
  static final String routeName = '/global-filter';

  const GlobalFilterScreen({Key? key}) : super(key: key);

  @override
  _GlobalFilterScreenState createState() => _GlobalFilterScreenState();
}

class _GlobalFilterScreenState extends State<GlobalFilterScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible=false;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          'Global Filter',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
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
                  top: 12,
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
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          TabBar(
            isScrollable: false,
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
                text: 'All',
              ),
              Tab(
                text: 'My Products',
              ),
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AllGlobalFilterTab(),
                MyProductsGlobalFilterTab()
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
                      title: 'Apply',
                    )),
                Padding(padding:EdgeInsets.symmetric(horizontal: 8)),
                Expanded(
                    child: AppFilledButton(
                      onPressed: _tabController!.index==0?() {
                        setState(() {
                          Provider.of<AppProvider>(context, listen: false).allFilterList.clear();
                        });
                      }:(){
                        setState(() {
                          Provider.of<AppProvider>(context, listen: false).myProductsFilterList.clear();
                        });
                      },
                      title: 'Reset',
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
