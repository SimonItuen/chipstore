import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/product/BrandListScreen.dart';
import 'package:chipstore_app/screens/schedule_appointment/ChipExpertsScreen.dart';
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

class ScheduleAppointmentScreen extends StatefulWidget {
  static final String routeName = '/schedule-appointment';

  const ScheduleAppointmentScreen({Key? key}) : super(key: key);

  @override
  _ScheduleAppointmentScreenState createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool onNotification = true;
  bool passwordVisible = false;

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
          'Schedule an appointment',
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
                    child: Text(
                      'Expert help where ever and whenever you need it - online, in-store or at home.',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  for (int i = 0; i < 2; i++)
                    Container(
                      height: 194.0.toScreenHeight(context),
                      margin: EdgeInsets.only(bottom: 14, top: 20),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: i == 0
                                  ? -17.0.toScreenHeight(context)
                                  : -9.0.toScreenHeight(context),
                              right: i == 0
                                  ? 16.0.toScreenWidth(context)
                                  : 172.0.toScreenWidth(context),
                              left: i == 0
                                  ? 179.0.toScreenWidth(context)
                                  : 24.0.toScreenWidth(context),
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/demo/am${i + 1}.png',
                                fit: BoxFit.cover,
                              )),
                          Positioned(
                            top: i == 0
                                ? 42.0.toScreenHeight(context)
                                : 53.0.toScreenHeight(context),
                            right: i == 0
                                ? 187.0.toScreenWidth(context)
                                : 24.0.toScreenWidth(context),
                            left: i == 0
                                ? 16.0.toScreenWidth(context)
                                : 195.0.toScreenWidth(context),
                            bottom: i==0?42.0.toScreenHeight(context):53.0.toScreenHeight(context),
                            child: Column(
                              children: [
                                Text(
                              i==0?'Need tech support,\ntroubleshooting or\nhelp with repairs?':'Need help finding the right thing?',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
                                Padding(padding: EdgeInsets.all(4)),
                                Text(
                                  i==0?'Connect with a customer\nrepresentative agent':'Shop with an Chips store expert',
                                  style: TextStyle(
                                      color: Color(0xFFf9f871), fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: Text(
                      'Other ways we can help you out',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 12),
                              width: 64.0.toScreenWidth(context),
                              height: 64.0.toScreenWidth(context),
                              decoration: BoxDecoration(
                                  color: Color(0xFFf2f6f8),
                                  shape: BoxShape.circle),
                              child: Icon(
                                ChipstoreAppIcons.schedule,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              'Option 1',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(ChipExpertsScreen.routeName);
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: 64.0.toScreenWidth(context),
                                height: 64.0.toScreenWidth(context),
                                decoration: BoxDecoration(
                                    color: Color(0xFFf2f6f8),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  ChipstoreAppIcons.customer_care,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                'Option 2',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(BrandListScreen.routeName);
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: 64.0.toScreenWidth(context),
                                height: 64.0.toScreenWidth(context),
                                decoration: BoxDecoration(
                                    color: Color(0xFFf2f6f8),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  ChipstoreAppIcons.star,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                'Option 3',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
