import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/AccountScreen.dart';
import 'package:chipstore_app/screens/bar_code_scanner/BarCodeScannerScreen.dart';
import 'package:chipstore_app/screens/explore/ExploreScreen.dart';
import 'package:chipstore_app/screens/favorites/FavoritesScreen.dart';
import 'package:chipstore_app/screens/home/ClearanceTab.dart';
import 'package:chipstore_app/screens/home/HomeScreen.dart';
import 'package:chipstore_app/screens/search_screen/SearchScreen.dart';
import 'package:chipstore_app/screens/shop/CategoryScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ParentScreen extends StatefulWidget {
  static final String routeName = '/parent';

  const ParentScreen({Key? key}) : super(key: key);

  @override
  _ParentScreenState createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int currentIndex = 0;
  List<Widget> _children = [
    HomeScreen(),
    ShopScreen(),
    ExploreScreen(),
    FavoritesScreen(),
    AccountScreen(),
  ];

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
      body: _children[appProvider.getCurrentScreen],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        selectedFontSize: 8,
        iconSize: 18,
        showUnselectedLabels: true,
        currentIndex: appProvider.getCurrentScreen,
        unselectedFontSize: 8,
        unselectedItemColor: Color(0XFF8c9091),
        onTap: (index) {
          Provider.of<AppProvider>(context, listen: false)
              .setCurrentScreen(index);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(ChipstoreAppIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(ChipstoreAppIcons.shop), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(ChipstoreAppIcons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(ChipstoreAppIcons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(ChipstoreAppIcons.profile), label: 'Account'),
        ],
      ),
    );
  }
}
