import 'package:chipstore_app/models/AppStatusesModel.dart';
import 'package:chipstore_app/screens/shop/SubCategoryScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/widgets/app_statuses_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class ElectronicsTab extends StatefulWidget {
  const ElectronicsTab({Key? key}) : super(key: key);

  @override
  _ElectronicsTabState createState() => _ElectronicsTabState();
}

class _ElectronicsTabState extends State<ElectronicsTab> {
  List<Color> cardColors = [
    Color(0xFFdccaba),
    Color(0xFFf7d8b5),
    Color(0xFFecb283),
    Color(0xFF99b9c2),
    Color(0xFFc1edd3),
  ];
  List<String> cardText = [
    'Mobile\nPhones',
    'Desktop\n& Laptops',
    'Tablets',
    'Smart\nWatches',
    'Gaming\nConsoles'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < 5; i++)
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(SubCategoryScreen.routeName);
                },
                child: Container(
                  height: 120.0.toScreenWidth(context),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: cardColors[i],
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Text(
                        '${cardText[i]}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Image.asset('assets/images/demo/e${i + 1}.png'),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
