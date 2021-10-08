import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/cart/ChooseGiftWrapScreen.dart';
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

class GiftWrapScreen extends StatefulWidget {
  static final String routeName = '/gift-wrap';

  const GiftWrapScreen({Key? key}) : super(key: key);

  @override
  _GiftWrapScreenState createState() =>
      _GiftWrapScreenState();
}

class _GiftWrapScreenState
    extends State<GiftWrapScreen> {
  TextEditingController messageEditingController = TextEditingController(text: 'Happy Birthday Mohammed! Wish you all the best and have a good day enjoy your gift 🎁 😊');
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            ChipstoreAppIcons.close,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          'Gift Wrap',
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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Personalize your gift with a box and wrapping.',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(ChooseGiftWrapScreen.routeName);
                        },
                        child: Container(
                          height: 76.0
                              .toScreenWidth(context),
                          width: 76.0
                              .toScreenWidth(context),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(
                                      0XFFF2F2F2)),
                              borderRadius:
                              BorderRadius
                                  .circular(4)),
                          child: ClipRRect(
                              borderRadius:
                          BorderRadius
                              .circular(4),
                            child: Image.asset(
                                'assets/images/demo/gw1.jpg'),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              'Medium gift box',
                              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              'KD 1.000',
                              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Text(
                      'Add a message',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: messageEditingController,
                    maxLines: 4,
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
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top:16.0, bottom: 34, left: 16, right: 16),
            child: AppFilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              title: 'Save',
            ),
          ),
        ],
      ),
    );
  }
}
