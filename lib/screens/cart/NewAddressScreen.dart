import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/cart/OrderFailureScreen.dart';
import 'package:chipstore_app/screens/store_locator/StoreLocatorScreen.dart';
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

class NewAddressScreen extends StatefulWidget {
  static final String routeName = '/new-address';

  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  _NewAddressScreenState createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  List<String> addressType = ['House', 'Apartment', 'Office'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onUse = false;
  bool onCreateAccount = false;
  bool passwordVisible = false;
  int selectedAddressIndex = -1;

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
          'New Address',
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
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 175,
                    width: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Positioned.fill(
                          child: Image.asset('assets/images/demo/map.JPG', fit: BoxFit.fill,height: 175,),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 16.0, right: 16.0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(StoreLocatorScreen.routeName);
                              }, child: Text('Change Location')),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Address name ',
                            ),
                            TextSpan(
                                text: '(Optional)',
                                style: TextStyle(color: Color(0xFFA6A6A6))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: TextFormField(
                      validator: (val) {
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
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 16, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Area',
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(color: Color(0xFFe4002b))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: TextFormField(
                      validator: (val) {
                        if (val.toString().trim().isEmpty) {
                          return 'Cannot be empty';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                      initialValue:
                          appProvider.getIsLoggedIn ? 'Al Jahra' : null,
                      decoration: InputDecoration(
                        hintText: 'Select an Area',
                        hintStyle:
                            TextStyle(color: Color(0xFFA6A6A6), fontSize: 14),
                        suffixIcon: Icon(
                          ChipstoreAppIcons.arrow_down,
                          size: 10,
                          color: Theme.of(context).primaryColor,
                        ),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 16, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Address Type',
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(color: Color(0xFFe4002b))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Expanded(
                            flex:1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedAddressIndex = i;
                                });
                              },
                              child: Container(
                                margin: i==1?EdgeInsets.symmetric(horizontal:8):EdgeInsets.zero,
                                child: Center(
                                  child: Text(
                                    '${addressType[i]}',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                padding: EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedAddressIndex == i
                                          ? Theme.of(context).primaryColor
                                          : Color(0XFFF2F2F2)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 16, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Block',
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(color: Color(0xFFe4002b))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: TextFormField(
                      validator: (val) {
                        if (val.toString().trim().isEmpty) {
                          return 'Cannot be empty';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                      initialValue:
                          appProvider.getIsLoggedIn ? 'Block 6' : null,
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 16, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Street',
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(color: Color(0xFFe4002b))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      validator: (val) {
                        if (val.toString().trim().isEmpty) {
                          return 'Cannot be empty';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                      initialValue:
                          appProvider.getIsLoggedIn ? '1 St 3 Lane' : null,
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 16, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'House Number',
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(color: Color(0xFFe4002b))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      validator: (val) {
                        if (val.toString().trim().isEmpty) {
                          return 'Cannot be empty';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
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
                  if (!appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, top: 16, left: 16, right: 16),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'OpenSans',
                                fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Full name',
                              ),
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Color(0xFFe4002b))),
                            ]),
                      ),
                    ),
                  if (!appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val.toString().trim().isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  if (!appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, top: 16, left: 16, right: 16),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'OpenSans',
                                fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Email',
                              ),
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Color(0xFFe4002b))),
                            ]),
                      ),
                    ),
                  if (!appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val.toString().trim().isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 16, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Mobile Number',
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(color: Color(0xFFe4002b))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          dialogSize: Size(
                              MediaQuery.of(context).size.width * 0.9,
                              MediaQuery.of(context).size.height * 0.85),
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: '+965',
                          favorite: ['+39', 'FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                          builder: (countryCode) {
                            if (countryCode != null) {
                              print(countryCode.flagUri.toString());
                              return Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border:
                                        Border.all(color: Color(0xFFF2F2F2))),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14),
                                    ),
                                    Padding(padding: EdgeInsets.all(4)),
                                    Icon(
                                      ChipstoreAppIcons.arrow_down,
                                      size: 6,
                                      color: Theme.of(context).primaryColor,
                                    )
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
                                color: Theme.of(context).primaryColor,
                                fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 12),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 24, left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Additional directions ',
                            ),
                            TextSpan(
                                text: '(Optional)',
                                style: TextStyle(color: Color(0xFFA6A6A6))),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      validator: (val) {
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
                  if (!appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, top: 16, left: 16, right: 16),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'OpenSans',
                                fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Want to ',
                              ),
                              TextSpan(
                                  text: 'checkout faster',
                                  style: TextStyle(color: Color(0xFFe188b0))),
                              TextSpan(
                                text:
                                    ' next time? Create an account with us & unlock all app features!',
                              ),
                            ]),
                      ),
                    ),
                  if (appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          FlutterSwitch(
                            value: onUse,
                            padding: 2,
                            toggleSize: 27.0.toScreenWidth(context),
                            width: 51.0.toScreenWidth(context),
                            height: 31.0.toScreenWidth(context),
                            activeColor: Color(0XFF34c759),
                            onToggle: (value) {
                              setState(() {
                                onUse = value;
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Expanded(
                            child: Text(
                              'Use as default address',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  if (!appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          FlutterSwitch(
                            value: onCreateAccount,
                            padding: 2,
                            toggleSize: 27.0.toScreenWidth(context),
                            width: 51.0.toScreenWidth(context),
                            height: 31.0.toScreenWidth(context),
                            activeColor: Color(0XFF34c759),
                            onToggle: (value) {
                              setState(() {
                                onCreateAccount = value;
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Expanded(
                            child: Text(
                              'Yes, create an account',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  if (onCreateAccount && !appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, top: 16, left: 16, right: 16),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'OpenSans',
                                fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Password',
                              ),
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Color(0xFFe4002b))),
                            ]),
                      ),
                    ),
                  if (onCreateAccount && !appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !passwordVisible,
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 12),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                ChipstoreAppIcons.eye_icon,
                                size: 16,
                              ),
                              color: passwordVisible
                                  ? Color(0XFF7F7F7F).withOpacity(0.6)
                                  : Theme.of(context).primaryColor,
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            )),
                      ),
                    ),
                  if (onCreateAccount && !appProvider.getIsLoggedIn)
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
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
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 34, left: 16, right: 16),
                    child: AppFilledButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(OrderFailureScreen.routeName);
                      },
                      title: 'Save Address',
                    ),
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
