import 'package:chipstore_app/extensions/app_extensions.dart';
import 'package:chipstore_app/screens/cart/CartScreen.dart';
import 'package:chipstore_app/screens/product/ProductDetailsSecondScreen.dart';
import 'package:chipstore_app/util/chipstore_app_icons.dart';
import 'package:chipstore_app/widgets/app_filled_button.dart';
import 'package:chipstore_app/widgets/app_outlined_button.dart';
import 'package:chipstore_app/widgets/clearance_product_tile.dart';
import 'package:chipstore_app/widgets/new_related_product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static final String routeName = '/product-details';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isListView = false;
  int selectedIndex = 1;
  int selectedRam = 1;
  int selectedStorage = 1;
  int selectedColor = 1;
  List<String> ram = ['8GB', '16GB', '32GB', '64GB'];
  List<String> storage = ['64GB', '128GB', '256GB', '512GB'];

  List<String> statusList = [
    'Deal of\nthe day',
    'iPhones\nXs',
    'iPhones\nXr',
    'iPhones\n11',
    'iPhones\n12'
  ];
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
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
          'Product Name',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Theme.of(context).primaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                child: Icon(
                  ChipstoreAppIcons.cart,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                )),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ProductDetailsSecondScreen.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 16, bottom: 16),
                      height: 375.0.toScreenWidth(context),
                      width: 375.0.toScreenWidth(context),
                      decoration: BoxDecoration(color: Colors.white),
                      child: PageView(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Image.asset('assets/images/demo/c.png')
                        ],
                        onPageChanged: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int j = 0; j < 3; j++)
                        Container(
                          height: 2,
                          width: 8,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: j == selectedIndex
                                ? Theme.of(context).primaryColor
                                : Color(0xFF8c9091).withOpacity(0.25),
                          ),
                        )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Text(
                      'Microsoft - Surface Laptop Go - 12.4” Touch-Screen - Intel 10th Generation Core i5 - 8GB Memory - 128 GB Solid State Drive - Sandstone',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 4, bottom: 4),
                    child: Text(
                      'Model: THH-00035  •  SKU: 6428997  •  Release: 10/13/2020',
                      style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 4, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          'KD 9.500',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                        Text(
                          '50% OFF',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFFee982c)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 0, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          'Color:',
                          style:
                              TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                        Text(
                          'Sandstone',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedColor = i;
                              });
                            },
                            child: Container(
                              margin: i != 0 && i != 4 - 1
                                  ? EdgeInsets.symmetric(horizontal: 12)
                                  : EdgeInsets.zero,
                              height: 80.0.toScreenWidth(context),
                              width: 80.0.toScreenWidth(context),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: i == selectedColor
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFd9d9d9)),
                                  color: Colors.white),
                              child: Image.asset('assets/images/demo/c.png'),
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 0, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          'RAM:',
                          style:
                              TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                        Text(
                          '${ram[selectedRam]}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < ram.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedRam = i;
                              });
                            },
                            child: Container(
                              margin: i != 0 && i != ram.length - 1
                                  ? EdgeInsets.symmetric(horizontal: 12)
                                  : EdgeInsets.zero,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: i == selectedRam
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFd9d9d9)),
                                  color: Colors.white),
                              child: Text(
                                '${ram[i]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 0, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          'Storage:',
                          style:
                              TextStyle(color: Color(0xFF7F7F7F), fontSize: 12),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                        Text(
                          '${storage[selectedStorage]}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < storage.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedStorage = i;
                              });
                            },
                            child: Container(
                              margin: i != 0 && i != storage.length - 1
                                  ? EdgeInsets.symmetric(horizontal: 12)
                                  : EdgeInsets.zero,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: i == selectedStorage
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor)
                                      : Border.all(color: Color(0xFFd9d9d9)),
                                  color: Colors.white),
                              child: Text(
                                '${storage[i]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Icon(
                      ChipstoreAppIcons.customize,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Personalize the product',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(),
                        if (isEdit)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                isEdit = true;
                              });
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color: Theme.of(context).primaryColor,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 24, left: 16, right: 16),
                    child: Text(
                      isEdit
                          ? '☺'
                          : 'Engrave a mix of emoji, text, and numbers to make product unmistakably yours. Only at The Chips Store.',
                      style: TextStyle(
                          color: Color(0xFF7F7F7F), fontSize: isEdit ? 16 : 12),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Available for store pick-up',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        AppOutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: 'Check store availability',
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Overview',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        Text(
                          'Product details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pharetra tincidunt ante. Aliquam maximus euismod tortor sed eleifend. Nunc et rutrum nisi. Cras ultrices, nisi quis ullamcorper posuere, neque ipsum gravida mauris, eget molestie ante odio eget erat. Quisque cursus eros ut orci aliquet, feugiat ultrices dolor consequat. ',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        Text(
                          'Product features',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                        ),
                        Text(
                          '• Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n• Nunc rutrum neque auctor lobortis pulvinar.\n• Aliquam vel ipsum ac justo interdum aliquam et nec nisi.\n• Proin scelerisque metus eget laoreet sodales.\n• In vehicula erat ac nunc commodo cursus.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        Text(
                          'Specifications',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pharetra tincidunt ante. Aliquam maximus euismod tortor sed eleifend. Nunc et rutrum nisi. Cras ultrices, nisi quis ullamcorper posuere, neque ipsum gravida mauris, eget molestie ante odio eget erat. Quisque cursus eros ut orci aliquet, feugiat ultrices dolor consequat. ',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 2; i++)
                              Container(
                                  width: 164.0.toScreenWidth(context),
                                  height: 124.0.toScreenWidth(context),
                                  child: Image.asset(
                                      'assets/images/demo/pi${i + 1}.png'),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF8c9091),
                                      borderRadius: BorderRadius.circular(8)))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        Container(
                            width: 343.0.toScreenWidth(context),
                            height: 164.0.toScreenWidth(context),
                            child: Image.asset('assets/images/demo/pi${3}.png'),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'What\'s in this box',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                        ),
                        Text(
                          '1 Device\n1 Charging Cable\n1 Adapter',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Video',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                                width: 343.0.toScreenWidth(context),
                                height: 193.0.toScreenWidth(context),
                                child:
                                    Image.asset('assets/images/demo/vi1.png'),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8))),
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 24,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Quick actions',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0xFFF2F2F2))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        ChipstoreAppIcons.compare_product,
                                        color: Color(0xFFe188b0),
                                        size: 24,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                      ),
                                      Text(
                                        'Compare\nproduct',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 112.0.toScreenHeight(context),
                                color: Color(0xFFF2F2F2),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        ChipstoreAppIcons.favorite,
                                        color: Color(0xFFe188b0),
                                        size: 24,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                      ),
                                      Text(
                                        'Add to\nfavorites',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 112.0.toScreenHeight(context),
                                color: Color(0xFFF2F2F2),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        ChipstoreAppIcons.share_product,
                                        color: Color(0xFFe188b0),
                                        size: 24,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                      ),
                                      Text(
                                        'Share\nthe product',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 16.0, left: 16.0, bottom: 16, top: 24),
                    child: Text(
                      'Have everything you need?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0.toScreenWidth(context)),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          NewRelatedProductTile(
                            onAddCartPressed: () {},
                            onCheckInStorePressed: () {},
                            thumbnailUrl:
                                'assets/images/demo/ca${i % 2 + 1}.png',
                            tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                            color: i % 2 == 0
                                ? Color(0xFFe188b0)
                                : Color(0xFFee982c),
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
                    child: AppOutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: 'View bundled products',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(),
                        Text(
                          'Sort by: ',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF7F7F7F)),
                        ),
                        Text(
                          'Most Relevant',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                        ),
                        Icon(
                          ChipstoreAppIcons.arrow_down,
                          size: 4,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0XFFF2F2F2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'The best iphone to ever exist!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'No matter where you go, iphone is the coolest, most happening thing around! It really saves me time and effort. iphone is exactly what our business has been lacking. Man, this thing is getting better and better as I learn more about it.',
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              for (int i = 0; i < 4; i++)
                                Container(
                                    width: 48.0.toScreenWidth(context),
                                    height: 48.0.toScreenWidth(context),
                                    margin: i == 0 || i == 4 - 1
                                        ? EdgeInsets.zero
                                        : EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.asset(
                                            'assets/images/demo/p${i + 1}.png')))
                            ],
                          ),
                        ),
                        Row(children: [
                          CircleAvatar(
                              radius: 6,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.check,
                                size: 6,
                                color: Color(0xFFF2F2F2),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          Text(
                            'Verified purchase',
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor),
                          ),
                        ])
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(children: [
                      Stack(
                        children: [
                          CircleAvatar(
                              radius: 20,
                              child: Image.asset(
                                'assets/images/demo/headphones.png',
                              )),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(0.5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    color: Color(0xFF9de07c)),
                                child: Icon(
                                  Icons.verified_rounded,
                                  size: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mohammed Abdullah',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              '1 day ago',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7F7F7F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              Icons.star_rate_rounded,
                              size: 12,
                              color: Color(0xFFee982c),
                            )
                        ],
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0XFFF2F2F2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Solid build quality 😊',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Thank you so much for your help. Iphone is awesome! Very easy to use.',
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFe188b0),
                          foregroundColor: Colors.white,
                          child: Text('AI')),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ahmed Ibrahim',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              '1 month ago',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7F7F7F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 4; i++)
                            Icon(
                              Icons.star_rate_rounded,
                              size: 12,
                              color: Color(0xFFee982c),
                            )
                        ],
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          'Frequently bought together',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.toScreenWidth(context)),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          ClearanceProduct(
                            onAddCartPressed: () {},
                            thumbnailUrl: 'assets/images/demo/c${i + 1}.png',
                            tag: i % 2 == 0 ? 'NEW' : 'BESTSELLER',
                            color: i % 2 == 0
                                ? Color(0xFFe188b0)
                                : Color(0xFFee982c),
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
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: AppOutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: 'Buy Now',
                        )),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                        Expanded(
                            child: AppFilledButton(
                          onPressed: () {},
                          title: 'Add to cart',
                        )),
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
}
