import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/account_tile.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class CouponsScreen extends StatefulWidget {
  static final String routeName = '/coupons';

  const CouponsScreen({Key? key}) : super(key: key);

  @override
  _CouponsScreenState createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  int selectedIndex = 0;

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
            Icons.arrow_back_ios_rounded,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          'Coupons',
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
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  for (int i = 0; i < 3; i++)
                    InkWell(
                      onTap: (){
                        showCouponAppliedDialog();
                      },
                      child: Container(
                        height: 243.0.toScreenHeight(context),
                        margin: EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: Image.asset(
                                  'assets/images/demo/cou${i + 1}.png',
                                  fit: BoxFit.fill,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        ChipstoreAppIcons.tap,
                                        color: Theme.of(context).primaryColor,
                                        size: 14,
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                      ),
                                      Text(
                                        'Tap to apply',
                                        style: TextStyle(
                                            color:
                                            Theme.of(context).primaryColor,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    'View details',
                                    style: TextStyle(
                                        color: Color(0xFF7F7F7F), fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Color(0xFFF2F2F2))),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  showCouponAppliedDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              padding: EdgeInsets.all(24),
              height: 312.0.toScreenHeight(context),
              child: Column(
                children: [
                  Container(
                    height: 80.0.toScreenWidth(context),
                    width: 80.0.toScreenWidth(context),
                    child: Image.asset('assets/images/coupon_code_applied.png'),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0,bottom: 4),
                    child: Text(
                      'Coupon code\nsuccessfully applied',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.only(top: 4.0,bottom: 24),
                    child: Text(
                      'Enjoy shopping with a discount of 50% off on selected items',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  AppFilledButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, title: 'Okay',)
                ],
              ),
            ),
          );
        });
  }
}
