import 'package:chipstore_app/screens/bar_code_scanner/BarCodeScannerScreen.dart';
import 'package:chipstore_app/screens/home/ClearanceTab.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_tab_indicator.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/search_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chipstore_app/extensions/app_extensions.dart';

class SearchScreen extends StatefulWidget {
  static final String routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searches =[
'iPhone 12 Pro Black 128gb',
    'JBL pulse 4',
    'Native union travel case'
  ];

  bool isSearching = false;

  TextEditingController searchController = TextEditingController();
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextFormField(
          controller: searchController,
          onChanged: (value){
            if(value.trim().length>0){
              setState(() {
                isSearching = true;
              });
            }else{
              setState(() {
                isSearching = false;
              });
            }
          },
          decoration: InputDecoration(
              hintText: 'Search for anything',
              hintStyle: TextStyle(fontSize: 12, color: Color(0XFFA6A6A6)),
              fillColor: Color(0XFF8C9091).withOpacity(0.1),
              filled: true,
              contentPadding: EdgeInsets.only(left: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(BarCodeScannerScreen.routeName);
                },
                icon: Icon(
                  ChipstoreAppIcons.qr_code,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                ),
              )),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Text('Cancel', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: isSearching?
        Column(
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
              child: Row(
                children: [
                  Text(
                    'Search Results',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            for(int i=0; i<3; i++)
              SearchTile(onPressed: (){}, title: searches[i], isLast:i==2),

          ],
        )
            :
        Column(
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
              child: Row(
                children: [
                  Text(
                    'Recently Searched',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            for(int i=0; i<3; i++)
              SearchTile(onPressed: (){}, title: searches[i], isLast:i==2),
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16, top: 24),
              child: Row(
                children: [
                  Text(
                    'Suggested Products',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Text(
                    'View all categories',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xFFee982c)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding:
              EdgeInsets.symmetric(horizontal: 8.0.toScreenWidth(context)),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    ClearanceProduct(
                        onAddCartPressed: (){},
                        thumbnailUrl: 'assets/images/demo/c${i + 1}.png',
                        tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                        color:
                        i % 2 == 0 ? Color(0xFFe188b0) : Color(0xFFee982c),
                        hasTags: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
