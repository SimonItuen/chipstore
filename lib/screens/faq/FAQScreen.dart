import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/saved_address/SavedAddressScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/account_tile.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class FAQScreen extends StatefulWidget {
  static final String routeName = '/faq';

  const FAQScreen({Key? key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible = false;
  bool hasExpanded = false;
  List<String> faqs = [
    'How long does it take to ship my order?',
    'When will my order arrive?',
    'How do I track my order?',
    'What’s your return policy?',
    'How do I make changes to an existing order?',
    'What shipping options do you have?',
    'Do you ship internationally?',
    'Do you sell gift cards?',
    'Can I receive a refund?',
    'Do you offer a referral program? How does it work?'
  ];

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
            Icons.arrow_back_ios_rounded,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          'Faqs',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz_outlined,
                color: Theme.of(context).primaryColor,
              ))
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
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(String s in faqs)
                  ExpansionTile(
                    title: Text(
                      '$s',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    trailing: hasExpanded
                        ? Icon(Icons.remove_rounded)
                        : Icon(
                            Icons.add_rounded,
                            color: Color(0xFF7F7F7F),
                          ),
                    onExpansionChanged: (val) {
                      setState(() {
                        hasExpanded = !hasExpanded;
                      });
                    },
                    children: [
                      Container(
                          padding: EdgeInsets.all(16),
                          color: Color(0xFFF2F2F2),
                          child: Text(
                            'Orders are usually shipped within 1-2 business days after placing the order.',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
