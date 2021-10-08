import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
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

class DigitalCardsScreen extends StatefulWidget {
  static final String routeName = '/digital-screen';

  const DigitalCardsScreen({Key? key}) : super(key: key);

  @override
  _DigitalCardsScreenState createState() => _DigitalCardsScreenState();
}

class _DigitalCardsScreenState extends State<DigitalCardsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible = false;
  List<String> tabs = ['All', 'Available', 'Expired'];
  int selectedIndex = 0;

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
          'My Digital Voucher',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xFFF2F2F2)),
            child: Row(
              children: [
                for (int i = 0; i < tabs.length; i++)
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: selectedIndex == i
                            ? Card(
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Center(
                                        child: Text(
                                      tabs[i],
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))))
                            : Center(
                                child: Text(
                                tabs[i],
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ))),
                  )
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 0.78095,
              crossAxisCount: 2,
              children: [
                for (int i = 0; i < 7; i++)
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Container(
                      width: 164.0.toScreenWidth(context),
                      margin: EdgeInsets.symmetric(
                          horizontal: 8.0.toScreenWidth(context)),
                      padding: EdgeInsets.all(16.0.toScreenWidth(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 48.0.toScreenWidth(context),
                            height: 48.0.toScreenWidth(context),
                            padding:
                                EdgeInsets.all(10.0.toScreenWidth(context)),
                            child: Image.asset(
                                'assets/images/demo/v${(i % 5) + 1}.png'),
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.all(4.0.toScreenWidth(context))),
                          Text(
                            'Itunes 100\$',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Theme.of(context).primaryColor),
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.all(2.0.toScreenWidth(context))),
                          Row(
                            children: [
                              Text(
                                'Expires on',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF7F7F7F)),
                              ),
                              Spacer(),
                              Text(
                                '21/05/2023',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.all(2.0.toScreenWidth(context))),
                          Row(
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF7F7F7F)),
                              ),
                              Spacer(),
                              Text(
                                'KWD 30.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.all(16.0.toScreenWidth(context))),
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Show code',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

}
