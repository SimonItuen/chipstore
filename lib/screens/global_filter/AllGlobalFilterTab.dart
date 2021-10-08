import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/providers/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllGlobalFilterTab extends StatefulWidget {
  const AllGlobalFilterTab({Key? key}) : super(key: key);

  @override
  _AllGlobalFilterTabState createState() => _AllGlobalFilterTabState();
}

class _AllGlobalFilterTabState extends State<AllGlobalFilterTab> {
  List<String> brandList = [
    'Apple',
    'Black Berry',
    'Casper',
    'Denski',
    'Energy',
    'Fulgy'
  ];
  List<String> brandTwoList = [
    'Apples',
    'Black Berrys',
    'Caspers',
    'Denskis',
    'Energys',
    'Fulgys'
  ];
  List<String> brandThreeList = [
    'Apples1',
    'Black Berrys1',
    'Caspers1',
    'Denskis1',
    'Energys1',
    'Fulgys1'
  ];

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ListTileTheme(
                dense: true,
                tileColor: Color(0xFFf2f6f8),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 12),
                  childrenPadding: EdgeInsets.zero,
                  collapsedBackgroundColor: Color(0xFFf2f6f8),
                  initiallyExpanded: true,
                  collapsedIconColor: Theme.of(context).primaryColor,
                  title: Container(
                    child: Text(
                      'Category',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  children: [
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    for (String brand in brandList)
                      InkWell(
                        onTap: () {
                          if (!appProvider.allFilterList.contains('$brand')) {
                            appProvider.allFilterList.add('$brand');
                            setState(() {});
                          } else {
                            appProvider.allFilterList.remove('$brand');
                            setState(() {});
                          }
                        },
                        child: Column(
                          children: [
                            AbsorbPointer(
                              absorbing: true,
                              child: Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    value: appProvider.allFilterList
                                        .contains('$brand'),
                                    tristate: true,
                                    onChanged: (value) {},
                                  ),
                                  Text(
                                    '$brand',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              color: Color(0xFFF2F2F2),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ListTileTheme(
                dense: true,
                tileColor: Color(0xFFf2f6f8),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 12),
                  childrenPadding: EdgeInsets.zero,
                  collapsedBackgroundColor: Color(0xFFf2f6f8),
                  initiallyExpanded: false,
                  collapsedIconColor: Theme.of(context).primaryColor,
                  title: Container(
                    child: Text(
                      'Category',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  children: [
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    for (String brand in brandTwoList)
                      InkWell(
                        onTap: () {
                          if (!appProvider.allFilterList.contains('$brand')) {
                            appProvider.allFilterList.add('$brand');
                            setState(() {});
                          } else {
                            appProvider.allFilterList.remove('$brand');
                            setState(() {});
                          }
                        },
                        child: Column(
                          children: [
                            AbsorbPointer(
                              absorbing: true,
                              child: Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    value: appProvider.allFilterList
                                        .contains('$brand'),
                                    tristate: true,
                                    onChanged: (value) {},
                                  ),
                                  Text(
                                    '$brand',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              color: Color(0xFFF2F2F2),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ListTileTheme(
                dense: true,
                tileColor: Color(0xFFf2f6f8),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 12),
                  childrenPadding: EdgeInsets.zero,
                  collapsedBackgroundColor: Color(0xFFf2f6f8),
                  initiallyExpanded: true,
                  collapsedIconColor: Theme.of(context).primaryColor,
                  title: Container(
                    child: Text(
                      'Category',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  children: [
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xFFF2F2F2),
                    ),
                    for (String brand in brandThreeList)
                      InkWell(
                        onTap: () {
                          if (!appProvider.allFilterList.contains('$brand')) {
                            appProvider.allFilterList.add('$brand');
                            setState(() {});
                          } else {
                            appProvider.allFilterList.remove('$brand');
                            setState(() {});
                          }
                        },
                        child: Column(
                          children: [
                            AbsorbPointer(
                              absorbing: true,
                              child: Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    value: appProvider.allFilterList
                                        .contains('$brand'),
                                    tristate: true,
                                    onChanged: (value) {},
                                  ),
                                  Text(
                                    '$brand',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              color: Color(0xFFF2F2F2),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
