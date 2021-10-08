import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/providers/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductsGlobalFilterTab extends StatefulWidget {
  const MyProductsGlobalFilterTab({Key? key}) : super(key: key);

  @override
  _MyProductsGlobalFilterTabState createState() => _MyProductsGlobalFilterTabState();
}

class _MyProductsGlobalFilterTabState extends State<MyProductsGlobalFilterTab> {


  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 16,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        crossAxisSpacing: 16,
        children: [
          for (int i = 0; i < 4; i++)
            InkWell(
              onTap: appProvider.myProductsFilterList.contains(i.toString())? () {
                      setState(() {
                        appProvider.myProductsFilterList.remove(i.toString());
                      });
                    }
                  :() {
                setState(() {
                  appProvider.myProductsFilterList.add(i.toString());
                });
              },
              child: Container(
                  width: 164.0.toScreenWidth(context),
                  height: 164.0.toScreenWidth(context),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: appProvider.myProductsFilterList.contains(i.toString())
                        ? Border.all(color: Theme.of(context).primaryColor)
                        : Border.all(color: Color(0xFFd9d9d9)),
                  ),
                  child: Image.asset('assets/images/demo/mp$i.png')),
            ),
        ],
      ),
    );
  }
}
