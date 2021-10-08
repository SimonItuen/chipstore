import 'package:chipstore_app/providers/app_provider.dart';
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

class RegisterScreen extends StatefulWidget {
  static final String routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          'Register',
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
                  Row(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'First name',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor, fontSize: 12),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'First name cannot be empty';
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
                        ],
                      )),
                      Padding(padding: EdgeInsets.all(4)),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Family name',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor, fontSize: 12),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'Family name cannot be empty';
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
                        ],
                      )),
                    ],
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Full name',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Full name cannot be empty';
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
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 24),
                    child: Text(
                      'Mobile number',
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 24),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Email cannot be empty';
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
                    padding: const EdgeInsets.only(bottom: 8.0, top: 24),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !passwordVisible,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Password cannot be empty';
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
                      suffixIcon:  IconButton(icon: Icon(ChipstoreAppIcons.eye_icon, size: 16,), color: passwordVisible? Color(0XFF7F7F7F).withOpacity(0.6): Theme.of(context).primaryColor, onPressed: (){
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Send me news and offers for chips store, and a special welcome discount!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        FlutterSwitch(
                          value: onNotification,
                          padding: 2,
                          toggleSize: 27.0.toScreenWidth(context),
                          width: 51.0.toScreenWidth(context),
                          height: 31.0.toScreenWidth(context),
                          activeColor: Color(0XFF34c759),
                          onToggle: (value) {
                            setState(() {
                              onNotification = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'By creating an account you agree to Chips ',
                            ),
                            TextSpan(
                                text: 'privacy notice',
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                            TextSpan(text: ' & ', style: TextStyle()),
                            TextSpan(
                                text: 'terms of use.',
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                          ]),
                    ),
                  ),
                  AppFilledButton(
                    onPressed: () {},
                    title: 'Sign up',
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
                                text: 'Already a member? ',
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
