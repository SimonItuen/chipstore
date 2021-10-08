import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/LoginScreen.dart';
import 'package:chipstore_app/screens/account/RegisterScreen.dart';
import 'package:chipstore_app/screens/contact_us/ContactUsScreen.dart';
import 'package:chipstore_app/screens/digital_cards/DigitalCardsScreen.dart';
import 'package:chipstore_app/screens/enter_draw/EnterDrawScreenScreen.dart';
import 'package:chipstore_app/screens/faq/FAQScreen.dart';
import 'package:chipstore_app/screens/notifications/NotificationsScreen.dart';
import 'package:chipstore_app/screens/order/OrderHistoryScreen.dart';
import 'package:chipstore_app/screens/profile/ProfileScreen.dart';
import 'package:chipstore_app/screens/saved_address/SavedAddressScreen.dart';
import 'package:chipstore_app/screens/schedule_appointment/ScheduleAppointmentScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/account_tile.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
            ChipstoreAppIcons.bell,
            size: 20,
            color: Theme
                .of(context)
                .primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(NotificationsScreen.routeName);
          },
        ),
        title: Text(
          'Account',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme
                  .of(context)
                  .primaryColor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.none,
              children: [
                Icon(
                  ChipstoreAppIcons.cart,
                  size: 20,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
                Positioned(
                  top: 12,
                  right: -10,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme
                              .of(context)
                              .primaryColor),
                      child: Text(
                        '99',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
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
                  appProvider.getIsLoggedIn
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Hi, Taha Fakhruddin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              fontSize: 16),
                        ),
                      ),
                      Text(
                        'Member since 19th Oct 2005',
                        style: TextStyle(
                            fontSize: 12, color: Color(0xFF7f7f7f)),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            height: 172.0.toScreenWidth(context),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16),
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  child: Row(
                                    children: [
                                      Icon(
                                        ChipstoreAppIcons.logo,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.w500,
                                                color: Color(0XFF666666),
                                                fontFamily: 'OpenSans',
                                                fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Member ID:',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              TextSpan(
                                                  text: '12345',
                                                  style: TextStyle(
                                                      color: Color(
                                                          0XFFf9f871),
                                                      fontWeight:
                                                      FontWeight
                                                          .bold)),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(left: 24),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'See your rewards history',
                                                  style: TextStyle(
                                                      color: Theme
                                                          .of(
                                                          context)
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                                InkWell(
                                                    onTap: () {},
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                          4.0),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios,
                                                        size: 8,
                                                        color: Theme
                                                            .of(
                                                            context)
                                                            .primaryColor,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            Padding(
                                                padding:
                                                EdgeInsets.all(12)),
                                            Row(
                                              children: [
                                                Text(
                                                  'Manage your rewards',
                                                  style: TextStyle(
                                                      color: Theme
                                                          .of(
                                                          context)
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                                InkWell(
                                                    onTap: () {},
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                          4.0),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios,
                                                        size: 8,
                                                        color: Theme
                                                            .of(
                                                            context)
                                                            .primaryColor,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Positioned(
                                            bottom: -(216.0.toScreenWidth(
                                                context) /
                                                2),
                                            right: -(216.0.toScreenWidth(
                                                context) /
                                                2),
                                            child: Container(
                                              width: 216.0
                                                  .toScreenWidth(context),
                                              height: 216.0
                                                  .toScreenWidth(context),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF9de07c)
                                                    .withOpacity(0.25),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 20, right: 16),
                                            width: 88.0
                                                .toScreenWidth(context),
                                            height: 88.0
                                                .toScreenWidth(context),
                                            child: Center(
                                                child: Text(
                                                  '2',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'DINCondensed',
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 48),
                                                )),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF9de07c),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                      : Column(
                    children: [
                      Text(
                        'Get rewards and exclusive deals, see tailored content and get recommendations.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            fontSize: 14),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Row(
                        children: [
                          Expanded(
                            child: AppOutlinedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                                Provider.of<AppProvider>(context,
                                    listen: false)
                                    .setIsLoggedIn(true);
                              },
                              title: 'Sign In',
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Expanded(
                            child: AppFilledButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                                Provider.of<AppProvider>(context,
                                    listen: false)
                                    .setIsLoggedIn(true);
                              },
                              title: 'Create Account',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(OrderHistoryScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.orders,
                    title: 'Orders',
                    hasNotice: true,
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.profile,
                    title: 'My Profile',
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(DigitalCardsScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.digital_cards,
                    title: 'Digital cards',
                  ),
                  AccountTile(
                    onPressed: () {
                      _showGiftCardsBottomSheet();
                    },
                    icon: ChipstoreAppIcons.gift_cards,
                    title: 'Gift cards',
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SavedAddressScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.location_point,
                    title: 'Addresses',
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 12),
                    child: Text(
                      'Services & Support',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Theme
                              .of(context)
                              .primaryColor),
                    ),
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(EnterDrawScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.appointments,
                    title: 'Appointments & repairs',
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ScheduleAppointmentScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.schedule,
                    title: 'Schedule an appointment',
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context).pushNamed(FAQScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.help_center,
                    title: 'Help Center',
                  ),
                  AccountTile(
                    onPressed: () {},
                    icon: ChipstoreAppIcons.stock_alerts,
                    title: 'Back in stock alerts',
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 12),
                    child: Text(
                      'Contact us',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Theme
                              .of(context)
                              .primaryColor),
                    ),
                  ),
                  AccountTile(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ContactUsScreen.routeName);
                    },
                    icon: ChipstoreAppIcons.message,
                    title: 'Send us a message',
                  ),
                  AccountTile(
                    onPressed: () {},
                    icon: ChipstoreAppIcons.whatsapp,
                    title: 'Whatsapp',
                  ),
                  AccountTile(
                    onPressed: () {},
                    icon: ChipstoreAppIcons.phone_call,
                    title: 'Phone Call',
                  ),
                  AccountTile(
                    onPressed: () {},
                    icon: ChipstoreAppIcons.live_chat,
                    title: 'Live Chat',
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                  ),
                  AccountTile(
                    onPressed: () {},
                    icon: ChipstoreAppIcons.language,
                    title: 'Language',
                  ),
                  AccountTile(
                    onPressed: () {},
                    icon: ChipstoreAppIcons.rate_us,
                    title: 'Rate us on the app store',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: InkWell(
                      onTap: () {
                        Provider.of<AppProvider>(context, listen: false)
                            .setIsLoggedIn(false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          ChipstoreAppIcons.logo,
                          color: Theme
                              .of(context)
                              .primaryColor,
                          size: 16,
                        ),
                        Spacer(),
                        Text(
                          'v 2.0.1',
                          style:
                          TextStyle(color: Color(0XFF8c9091), fontSize: 12),
                        ),
                      ],
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

  void _showGiftCardsBottomSheet() async {
    int selectedTile = 0;
    List<String> tabs = ['Email to friend', 'Print at home'];
    int selectedIndex = 0;
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
                  padding: EdgeInsets.symmetric(vertical: 24),
                  constraints: BoxConstraints(
                      maxHeight: 750.0.toScreenHeight(context)
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFFfafafa).withOpacity(0.93),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Gift cards',
                                    style: TextStyle(
                                        color: Theme
                                            .of(context)
                                            .primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF3c3c43).withOpacity(
                                          0.3)),
                                  child: Icon(
                                    Icons.close,
                                    color: Color(0xFF7F7F7F),
                                    size: 20,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Color(0xFFF2F2F2),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Choose your card design',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < 3; i++)
                                Container(
                                  width: 250.0.toScreenWidth(context),
                                  height: 160.0.toScreenWidth(context),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 58.0.toScreenWidth(context)),
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: i == 0
                                          ? Color(0xFFee982c)
                                          : i == 1
                                          ? Theme
                                          .of(context)
                                          .primaryColor
                                          : Color(0xFFe188b0)),
                                  child: Center(
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                        color: Colors.white,
                                        fit: BoxFit.scaleDown,
                                      )),
                                )
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(12)),
                        Padding(
                          padding:
                          EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
                          child: Row(
                            children: [
                              Text(
                                'Personalized Card',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Theme
                                        .of(context)
                                        .primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            childAspectRatio: 4,
                            children: [
                              for (int i = 0; i < 4; i++)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTile = i;
                                    });
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        width: 167.0.toScreenWidth(context),
                                        decoration: BoxDecoration(
                                            border: selectedTile == i ? Border.all(
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor) : Border.all(color:Color(0xFFF2F2F2)),
                                        borderRadius: BorderRadius.circular(4)),
                                        padding: EdgeInsets.all(
                                            8.0.toScreenWidth(context)),
                                        child: Center(child: Text('KD ${i + 4}',
                                          style: TextStyle(color: Theme
                                              .of(context)
                                              .primaryColor),)),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0, bottom: 8, left: 16, right: 16),
                          child: Text(
                            'To',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'To cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 14),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
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
                          padding: const EdgeInsets.only(top: 24.0, bottom: 8, left: 16, right: 16),
                          child: Text(
                            'From',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'From cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0, bottom: 8, left: 16, right: 16),
                          child: Text(
                            'Message',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'Message cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
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
                        if(selectedIndex==0)Padding(
                          padding: const EdgeInsets.only(top: 24.0, bottom: 8, left: 16, right: 16),
                          child: Text(
                            'Recipient Email',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 12),
                          ),
                        ),
                        if(selectedIndex==0)Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'Recipient Email cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        if(selectedIndex==0)Padding(
                          padding: const EdgeInsets.only(top: 24.0, bottom: 8, left: 16, right: 16),
                          child: Text(
                            'Confirm Recipient Email',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 12),
                          ),
                        ),
                        if(selectedIndex==0)Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return 'Recipient Email cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFF2F2F2)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: AppFilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            title: 'Add to Cart',
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
