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

class ElectronicsTwoTab extends StatefulWidget {
  const ElectronicsTwoTab({Key? key}) : super(key: key);

  @override
  _ElectronicsTwoTabState createState() => _ElectronicsTwoTabState();
}

class _ElectronicsTwoTabState extends State<ElectronicsTwoTab> {
  List<Color> cardColors = [
    Color(0xFFdccaba),
    Color(0xFFf7d8b5),
    Color(0xFFecb283),
    Color(0xFF99b9c2),
    Color(0xFFc1edd3),
  ];
  List<String> cardText = [
    'Cables',
    'Grips',
    'Tablets',
    'Airpods\nAccessories',
    'Phone\nAccessories',
    'Laptop\nAccessories',
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
                  _showPurchaseGiftNotificationBottomSheet();
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${cardText[i]}',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14 ),
                        ),
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

  void _showPurchaseGiftNotificationBottomSheet() async {
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
                  height: 726.0.toScreenHeight(context),
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 4),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(ChipstoreAppIcons.clock,
                                    color: Theme.of(context).primaryColor, size: 21),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8)
                              ),
                              Text(
                                'Grab your gift now!',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.close,
                                    color: Color(0xFF7F7F7F), size: 14),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 24.0, right: 24, bottom: 16, top: 24),
                          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16, bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFFe188b0)
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Time Left',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                              Spacer(),
                              Text(
                                '12:12:02',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 24.0, right: 24, bottom: 16, top: 0),
                          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16, bottom: 16),
                          height: 326.0.toScreenWidth(context),
                          width: 326.0.toScreenWidth(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFF2F2F2)
                          ),
                          child: Image.asset('assets/images/demo/c.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 4, bottom: 4),
                          child: Text(
                            'Microsoft - Surface Laptop Go - 12.4” Touch-Screen - Intel 10th Generation Core i5 - 8GB Memory - 128 GB Solid State Drive - Sandstone',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 4, bottom: 4),
                          child: Text(
                            'Model: THH-00035  •  SKU: 6428997  •  Release: 10/13/2020',
                            style: TextStyle(
                                color:Color(0xFF7F7F7F),
                                fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 4, bottom: 4),
                          child: Row(
                            children: [
                              Text('KD 9.500', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, decoration: TextDecoration.lineThrough), ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                              Text('50% OFF', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFFee982c)), ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 4, bottom: 4),
                          child: Text(
                            'KD 4.750',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16, left: 16, right: 16),
                          child: AppFilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            title: 'Add to cart',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
