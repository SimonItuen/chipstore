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
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  static final String routeName = '/user-details';

  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String selectedMaritalStatus = 'Married';
  String selectedGender = 'Male';
  List<String> maritalStatus = ['Single', 'Married', 'Divorced', 'Widowed'];
  List<String> gender = ['Male', 'Female', 'Rather not Say'];

  TextEditingController dateOfBirthController = TextEditingController();

   DateTime? _selectedDate;

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
          'User Details',
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                    initialValue: 'Taha Fakhruddin',
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
                    padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                    child: Text(
                      'Last name',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Last name cannot be empty';
                      }
                      return null;
                    },
                    initialValue: 'Akbar Ali',
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
                    padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                    child: Text(
                      'Nationality',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CountryCodePicker(
                          dialogSize: Size(
                              MediaQuery.of(context).size.width * 0.9,
                              MediaQuery.of(context).size.height * 0.85),
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: '+91',
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border:
                                        Border.all(color: Color(0xFFF2F2F2))),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${countryCode.toCountryStringOnly().toString().replaceAll('+', '')}',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(4)),
                                    Icon(
                                      ChipstoreAppIcons.arrow_down,
                                      size: 8,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Padding(padding: EdgeInsets.all(4)),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                    child: Text(
                      'Marital Status',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  DropdownButtonFormField(
                    value: selectedMaritalStatus,
                    onChanged: (String? value){
                      setState(() {
                        selectedMaritalStatus = value.toString();
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        ChipstoreAppIcons.arrow_down,
                        size: 8,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Marital Status cannot be empty';
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
                    items: maritalStatus
                        .map((String e) => DropdownMenuItem(
                              child: Text(
                                '$e',
                                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontFamily: 'OpenSans'),
                              ),
                              value: e,
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  DropdownButtonFormField(
                    value: selectedGender,
                    onChanged: (String? value){
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        ChipstoreAppIcons.arrow_down,
                        size: 8,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Gender cannot be empty';
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
                    items: gender
                        .map((String e) => DropdownMenuItem(
                              child: Text(
                                '$e',
                                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontFamily: 'OpenSans'),
                              ),
                              value: e,
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                    child: Text(
                      'Date of Birth',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onTap: (){
                      FocusScope.of(context).requestFocus(new FocusNode());
                      setDateOfBirth();
                    },
                    showCursor: false,
                    enableInteractiveSelection: false,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Date of Birth cannot be empty';
                      }
                      return null;
                    },
                    controller: dateOfBirthController,
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          ChipstoreAppIcons.arrow_down,
                          size: 8,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Color(0xFFF2F2F2),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 34),
            child: AppFilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed(OTPScreen.routeName);
              },
              title: 'Save Changes',
            ),
          ),
        ],
      ),
    );
  }
  Future<void> setDateOfBirth() async {
    DateTime? pickedDate = await showDatePicker(
      helpText: 'Select Date of Birth',
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      dateOfBirthController.text = Jiffy(pickedDate).format('do MMM yyyy');
      setState(() {
        _selectedDate= pickedDate;
      });
    }
  }

}
