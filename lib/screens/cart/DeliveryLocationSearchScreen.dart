import 'dart:collection';

import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/cart/DeliveryLocationMapScreen.dart';
import 'package:chipstore_app/services/HttpService.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:provider/provider.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class DeliveryLocationSearchScreen extends StatefulWidget {
  static final String routeName = '/delivery-location-search';

  const DeliveryLocationSearchScreen({Key? key}) : super(key: key);

  @override
  _DeliveryLocationSearchScreenState createState() =>
      _DeliveryLocationSearchScreenState();
}

class _DeliveryLocationSearchScreenState
    extends State<DeliveryLocationSearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onIsSearching = false;
  bool passwordVisible = false;
  TextEditingController searchController = TextEditingController();
  List<String> firstList = [
    'Abdullah Al-Salem',
    'Adailiya',
    'Bneid Al Qar',
    'Daiya',
    'Dasma',
    'Doha'
  ];
  List<String> secondList = [
    'Al-Bedae',
    'Bayan',
    'Hawally',
    'Hitteen',
    'Jabriya',
    'Maidan Hawally'
  ];
  LinkedHashMap<String, HighlightedWord>? words;

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    if (onIsSearching) {
      searchController.text = '';
      setState(() {
        onIsSearching = false;
      });
      return false;
    } else {
      return true;
    }
    // return
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
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
            'Delivery Location',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Theme.of(context).primaryColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(DeliveryLocationMapScreen.routeName);
                },
                icon: Icon(
                  ChipstoreAppIcons.map,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 1,
                width: double.infinity,
                color: Color(0xFFF2F2F2),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (val) async {
                    if (val.trim().isNotEmpty) {
                      print(val);
                      words = {
                        for (String s in val.trim().split(' '))
                          '$s': HighlightedWord(
                            onTap: () {},
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                      } as LinkedHashMap<String, HighlightedWord>;
                      print('This is $words');
                      setState(() {
                        onIsSearching = true;
                      });
                      await HttpService.searchArea(context, text: val);
                    } else {
                      setState(() {
                        onIsSearching = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: onIsSearching ? 12 : 0,
                          right: 0,
                          top: 0,
                          bottom: 0),
                      border: OutlineInputBorder(),
                      hintText: 'Search for your area',
                      hintStyle: TextStyle(
                          fontSize: 12, color: Theme.of(context).primaryColor),
                      prefixIcon: !onIsSearching
                          ? Icon(
                              Icons.search_rounded,
                              size: 12,
                              color: Color(0xFF8c9091),
                            )
                          : null,
                      suffixIcon: onIsSearching
                          ? IconButton(
                              onPressed: () {
                                searchController.text = '';
                                setState(() {
                                  onIsSearching = false;
                                });
                              },
                              icon: Icon(
                                ChipstoreAppIcons.cancel_outlined_circle,
                                size: 12,
                                color: Color(0xFF8c9091),
                              ),
                            )
                          : null),
                ),
              ),
              if (!onIsSearching)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Color(0xFFF2F2F2),
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Text(
                        'Kuwait City (Capital)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    for (String s in firstList)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, top: 16, right: 16, left: 16),
                            child: Text(
                              '$s',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Divider(
                            indent: 16,
                            color: s == firstList.last
                                ? Colors.transparent
                                : Theme.of(context).dividerColor,
                          )
                        ],
                      ),
                    Container(
                      color: Color(0xFFF2F2F2),
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Text(
                        'Hawally',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    for (String s in secondList)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, top: 16, right: 16, left: 16),
                            child: Text(
                              '$s',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Divider(
                            indent: 16,
                            color: s == secondList.last
                                ? Colors.transparent
                                : Theme.of(context).dividerColor,
                          )
                        ],
                      ),
                  ],
                ),
              if (onIsSearching)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (String s in firstList)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, top: 16, right: 16, left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextHighlight(
                                  text: 'Jabriya',
                                  enableCaseSensitive: false,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF7F7F7F),
                                  ),
                                  words: words
                                      as LinkedHashMap<String, HighlightedWord>,
                                ),
                                Text(
                                  'Kuwait',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF7F7F7F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            indent: 16,
                            color: s == firstList.last
                                ? Colors.transparent
                                : Theme.of(context).dividerColor,
                          )
                        ],
                      ),
                    Center(
                      child: Container(
                          width: 144.0.toScreenWidth(context),
                          child: Image.asset(
                            'assets/images/powered_by_google.png',
                            fit: BoxFit.scaleDown,
                          )),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
