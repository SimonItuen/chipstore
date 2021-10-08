import 'package:chipstore_app/models/UserInterestModel.dart';
import 'package:chipstore_app/screens/parent/ParentScreen.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/user_interest_tile.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserPreferenceScreen extends StatefulWidget {
  static final String routeName = '/user-preference';

  const UserPreferenceScreen({Key? key}) : super(key: key);

  @override
  _UserPreferenceScreenState createState() => _UserPreferenceScreenState();
}

class _UserPreferenceScreenState extends State<UserPreferenceScreen> {
  List<UserInterestModel> selectedInterest = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Color(0xFF8C9051), fontSize: 12),
                  ),
                )),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 16, right: 16, bottom: 8.0),
                  child: Text(
                    'Choose your interests',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 16, right: 16, bottom: 8.0),
                  child: Text(
                    'This will help us recommend new &\nrevelant products to you',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF8C9051), fontSize: 12),
                  ),
                )),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  for (UserInterestModel model in demoList)
                    UserInterestTile(
                      onPressed: () {
                        if (selectedInterest.contains(model)) {
                          selectedInterest.remove(model);
                          setState(() {});
                        } else {
                          selectedInterest.add(model);
                          setState(() {});
                        }
                      },
                      isSelected: selectedInterest.any((element) =>
                          element.thumbnailUrl == model.thumbnailUrl),
                      title: model.title,
                      thumbnailUrl: model.thumbnailUrl,
                    )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16.0, right: 16, bottom: 32),
              child: AppFilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ParentScreen.routeName);
                },
                title: 'Confirm',
                color: selectedInterest.isNotEmpty
                    ? Theme.of(context).primaryColor
                    : Color(0xFFBFBFBF),
              ),
            )
          ],
        ),
      ),
    );
  }
}
