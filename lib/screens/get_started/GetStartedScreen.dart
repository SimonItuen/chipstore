import 'package:chipstore_app/models/LanguageModel.dart';
import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/get_started/GetStartedSecondScreen.dart';
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

class GetStartedScreen extends StatefulWidget {
  static final String routeName = '/get-started';

  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
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
                      'assets/images/get_started_pic_1.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ));
            },
          )),
          Positioned.fill(
              child: Container(
            margin: EdgeInsets.only(top: 400.0.toScreenHeight(context)),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFFFB9A35),
              Color(0xFFFB9A35),
              Color(0xFFFB9A35).withOpacity(0.0)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          )),
          Positioned.fill(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 68.0.toScreenHeight(context)),
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    _showLanguageBottomSheet();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        '${appProvider.getCurrentLanguage.flagUrl}',
                        width: 16,
                        height: 16,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '${appProvider.getCurrentLanguage.title}',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white.withOpacity(0.75),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(30)),
              ),
              Spacer(),
              Container(
                width: 236.0.toScreenWidth(context),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 48),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < 3; i++)
                          SlidingTile(isActive: i == currentIndex)
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 64.0.toScreenHeight(context)),
                    child: InkWell(
                      onTap: () {
                        _showPermissionBottomSheet();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.keyboard_backspace_rounded,
                                  color: Colors.white,
                                  size: 18,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ))
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
                          .pushNamed(GetStartedSecondScreen.routeName);
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
