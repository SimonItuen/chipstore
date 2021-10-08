import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/cart/GiftWrapScreen.dart';
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

class PersonalizeProductNameScreen extends StatefulWidget {
  static final String routeName = '/personalize-product-name';

  const PersonalizeProductNameScreen({Key? key}) : super(key: key);

  @override
  _PersonalizeProductNameScreenState createState() =>
      _PersonalizeProductNameScreenState();
}

class _PersonalizeProductNameScreenState
    extends State<PersonalizeProductNameScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible = false;
  TextEditingController engravingTextController =
      TextEditingController(text: '☺');

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
          'Personalize your product name',
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
                      'Engrave a mix of emoji, text, and numbers to make product unmistakably yours. Only at The Chips Store. Engraving fee KD 2.',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Add emoji with a tap. Type in text or numbers. You can even mix multiple emoji with text.',
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 14),
                    ),
                  ),
                  Container(
                    width: 343.0.toScreenWidth(context),
                    height: 343.0.toScreenWidth(context),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFFF2F2F2)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset('assets/images/demo/ppn.png'),
                        Text(
                          engravingTextController.text,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.25)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                    child: Text(
                      'Your engraving',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: engravingTextController,
                    onChanged: (val) {
                      setState(() {});
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Engraving cannot be empty';
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFFF2F2F2)),
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
                Navigator.of(context).pushNamed(GiftWrapScreen.routeName);
              },
              title: 'Save',
            ),
          ),
        ],
      ),
    );
  }
}
