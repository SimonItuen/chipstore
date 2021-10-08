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

class ForgotPasswordScreen extends StatefulWidget {
  static final String routeName = '/forgot-password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            Icons.arrow_back_ios_rounded,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          'Reset password',
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: Text('Enter your mobile number to receive instructions on how to reset your password', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Mobile Number',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      CountryCodePicker(
                        dialogSize: Size(MediaQuery.of(context).size.width *0.9, MediaQuery.of(context).size.height *0.85),
                        onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: '+965',
                        favorite: ['+39','FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                        builder: (countryCode){
                          if(countryCode!=null) {
                            print(countryCode.flagUri.toString());
                            return Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: Color(0xFFF2F2F2))),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          countryCode.flagUri.toString(),
                                          package: 'country_code_picker',
                                          height: 20,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text(
                                    '${countryCode.dialCode.toString().replaceAll('+', '')}',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor, fontSize: 14),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Icon(ChipstoreAppIcons.arrow_down, size: 6, color: Theme.of(context).primaryColor,)
                                ],
                              ),
                            );
                          }
                        },

                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return 'Mobile number cannot be empty';
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
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(4),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Mobile Number?', style: TextStyle(color: Color(0xFF7f7f7f), fontSize: 12),),
                      ),
                    ),
                  ),
                  AppFilledButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(OTPScreen.routeName);
                    },
                    title: 'Reset password',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'OpenSans',
                                fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Or return to ',
                              ),
                              TextSpan(
                                  text: 'Log in',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ]),
                      ),
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
}
