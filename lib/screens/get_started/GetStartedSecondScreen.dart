import 'package:chipstore_app/models/LanguageModel.dart';
import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/user_preference/UserPreferenceScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/language_change_tile.dart';
import 'package:chipstore_app/widgets/permission_tile.dart';
import 'package:chipstore_app/widgets/sliding_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:chipstore_app/providers/app_provider.dart';

class GetStartedSecondScreen extends StatefulWidget {
  static final String routeName = '/get-started-second';

  const GetStartedSecondScreen({Key? key}) : super(key: key);

  @override
  _GetStartedSecondScreenState createState() => _GetStartedSecondScreenState();
}

class _GetStartedSecondScreenState extends State<GetStartedSecondScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned.fill(
              child: PageView.builder(
            controller: pageController,
            physics: AlwaysScrollableScrollPhysics(),
            onPageChanged: onPageChanged,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                  color: Color(0xFFFB9A35),
                  child: Container(
                    padding:
                        EdgeInsets.only(bottom: 208.0.toScreenHeight(context)),
                    child: Image.asset(
                      'assets/images/get_started_pic_2.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ));
            },
          )),
          Positioned.fill(
              child: Container(
            margin: EdgeInsets.only(top: 252.0.toScreenHeight(context)),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.0)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          )),
          Positioned.fill(
              child: Container(
            margin: EdgeInsets.only(bottom: 336.0.toScreenHeight(context)),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black.withOpacity(0.0),
              Colors.black.withOpacity(0.0)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          )),
          Positioned.fill(
              child: Container(
            margin: EdgeInsets.only(top: 491.0.toScreenHeight(context)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  Text(
                    'Let’s get started!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                  Text(
                    'Register today for a special discount off\nyour first purchase',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24),
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Center(
                      child: Text(
                        'Create an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.white)
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text(
                      'Already have an account? Log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(UserPreferenceScreen.routeName);
                    },
                    child: Text(
                      'Continue as guest',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet() async {
    int imageSelectedAsDp = -1;
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              constraints: BoxConstraints(
                  minHeight: 0, maxHeight: 250.0.toScreenHeight(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select a Preferred Language',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      ),
                      IconButton(
                          icon: Icon(
                            ChipstoreAppIcons.close,
                            color: Colors.grey,
                            size: 12,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          })
                    ],
                  ),
                  LanguageChangeTile(
                    flagUrl: 'assets/images/arabic_flag.png',
                    title: 'العربية',
                    onPressed: () {
                      Provider.of<AppProvider>(context, listen: false)
                          .setCurrentLanguage(LanguageModel(
                              flagUrl: 'assets/images/arabic_flag.png',
                              title: 'العربية'));
                      Navigator.of(context).maybePop();
                    },
                  ),
                  LanguageChangeTile(
                    flagUrl: 'assets/images/english_flag.png',
                    title: 'English',
                    onPressed: () {
                      Provider.of<AppProvider>(context, listen: false)
                          .setCurrentLanguage(LanguageModel(
                              flagUrl: 'assets/images/english_flag.png',
                              title: 'English'));
                      Navigator.of(context).maybePop();
                    },
                  ),
                ],
              ),
            );
          });
        });
  }

  void _showPermissionBottomSheet() async {
    int imageSelectedAsDp = -1;
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              constraints: BoxConstraints(
                  minHeight: 0, maxHeight: 515.0.toScreenHeight(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'We require your permission',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      ),
                      IconButton(
                          icon: Icon(
                            ChipstoreAppIcons.close,
                            color: Colors.grey,
                            size: 12,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          })
                    ],
                  ),
                  PermissionTile(
                    icon: ChipstoreAppIcons.bell,
                    title: 'Notification',
                    description:
                        'Get notified about latest offers, seminar reminders and additional benefits!',
                  ),
                  PermissionTile(
                    icon: ChipstoreAppIcons.location_point,
                    title: 'Location',
                    description:
                        'Find the nearest Chips store to you. Your location will not be tracked.',
                  ),
                  PermissionTile(
                    icon: ChipstoreAppIcons.contacts,
                    title: 'Contacts',
                    description:
                        'Get in touch with our 24/7 available agents with your questions or suggestions.',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 48.0.toScreenHeight(context),
                        bottom: 24.0.toScreenHeight(context)),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF666666),
                              fontFamily: 'OpenSans',
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Tap ',
                            ),
                            TextSpan(
                                text: '‘Proceed’ ',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                )),
                            TextSpan(
                                text: 'to accept our ', style: TextStyle()),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                )),
                          ]),
                    ),
                  ),
                  AppFilledButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(UserPreferenceScreen.routeName);
                    },
                    title: 'Proceed',
                  )
                ],
              ),
            );
          });
        });
  }
}
