import 'package:chipstore_app/providers/app_provider.dart';
import 'package:chipstore_app/screens/account/ForgotPasswordScreen.dart';
import 'package:chipstore_app/screens/account/LoginScreen.dart';
import 'package:chipstore_app/screens/account/OTPScreen.dart';
import 'package:chipstore_app/screens/account/RegisterScreen.dart';
import 'package:chipstore_app/screens/bar_code_scanner/BarCodeScannerScreen.dart';
import 'package:chipstore_app/screens/cart/CartScreen.dart';
import 'package:chipstore_app/screens/cart/ChooseGiftWrapScreen.dart';
import 'package:chipstore_app/screens/cart/CouponsScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryLocationMapScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryLocationSearchScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryTimeScreen.dart';
import 'package:chipstore_app/screens/cart/DeliveryTypeScreen.dart';
import 'package:chipstore_app/screens/cart/GiftWrapScreen.dart';
import 'package:chipstore_app/screens/cart/NewAddressScreen.dart';
import 'package:chipstore_app/screens/cart/OrderConfirmationScreen.dart';
import 'package:chipstore_app/screens/cart/OrderFailureScreen.dart';
import 'package:chipstore_app/screens/cart/OrderSuccessScreen.dart';
import 'package:chipstore_app/screens/cart/PersonalizeProductNameScreen.dart';
import 'package:chipstore_app/screens/contact_us/ContactUsScreen.dart';
import 'package:chipstore_app/screens/contact_us/ContactUsSuccessScreen.dart';
import 'package:chipstore_app/screens/digital_cards/DigitalCardsScreen.dart';
import 'package:chipstore_app/screens/enter_draw/EnterDrawScreenScreen.dart';
import 'package:chipstore_app/screens/faq/FAQScreen.dart';
import 'package:chipstore_app/screens/get_started/GetStartedScreen.dart';
import 'package:chipstore_app/screens/get_started/GetStartedSecondScreen.dart';
import 'package:chipstore_app/screens/global_filter/GlobalFilterScreen.dart';
import 'package:chipstore_app/screens/notifications/NotificationsScreen.dart';
import 'package:chipstore_app/screens/order/OrderDetailsInStoreScreen.dart';
import 'package:chipstore_app/screens/order/OrderDetailsScreen.dart';
import 'package:chipstore_app/screens/order/OrderDetailsSelfPickUpScreen.dart';
import 'package:chipstore_app/screens/order/OrderHistoryScreen.dart';
import 'package:chipstore_app/screens/parent/ParentScreen.dart';
import 'package:chipstore_app/screens/product/BrandListScreen.dart';
import 'package:chipstore_app/screens/product/BrandProductListingScreen.dart';
import 'package:chipstore_app/screens/product/CelebrityProductListingScreen.dart';
import 'package:chipstore_app/screens/product/CompareProductsScreen.dart';
import 'package:chipstore_app/screens/product/CustomizeProductScreen.dart';
import 'package:chipstore_app/screens/product/ProductDetailsScreen.dart';
import 'package:chipstore_app/screens/product/ProductDetailsSecondScreen.dart';
import 'package:chipstore_app/screens/product/ProductListingScreen.dart';
import 'package:chipstore_app/screens/product/ProductListingSecondScreen.dart';
import 'package:chipstore_app/screens/profile/ProfileScreen.dart';
import 'package:chipstore_app/screens/profile/UserDetailsScreen.dart';
import 'package:chipstore_app/screens/saved_address/SavedAddressScreen.dart';
import 'package:chipstore_app/screens/schedule_appointment/ChipExpertsScreen.dart';
import 'package:chipstore_app/screens/schedule_appointment/ScheduleAppointmentScreen.dart';
import 'package:chipstore_app/screens/search_screen/SearchScreen.dart';
import 'package:chipstore_app/screens/shop/SubCategoryListScreen.dart';
import 'package:chipstore_app/screens/shop/SubCategoryScreen.dart';
import 'package:chipstore_app/screens/store_locator/StoreDetailsScreen.dart';
import 'package:chipstore_app/screens/store_locator/StoreLocationMapViewScreen.dart';
import 'package:chipstore_app/screens/store_locator/StoreLocatorScreen.dart';
import 'package:chipstore_app/screens/story_preview/StoryPreviewScreen.dart';
import 'package:chipstore_app/screens/user_preference/UserPreferenceScreen.dart';
import 'package:chipstore_app/util/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: ColorsUtil.primaryColor,
        fontFamily: 'OpenSans'
      ),
      routes: {
        '/': (_) => GetStartedScreen(),
        GetStartedSecondScreen.routeName: (_) => GetStartedSecondScreen(),
        UserPreferenceScreen.routeName: (_) =>UserPreferenceScreen(),
        ParentScreen.routeName: (_) => ParentScreen(),
        SearchScreen.routeName: (_) => SearchScreen(),
        BarCodeScannerScreen.routeName: (_) => BarCodeScannerScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        ForgotPasswordScreen.routeName: (_) => ForgotPasswordScreen(),
        OTPScreen.routeName: (_) => OTPScreen(),
        SubCategoryScreen.routeName: (_) => SubCategoryScreen(),
        CartScreen.routeName: (_) => CartScreen(),
        OrderConfirmationScreen.routeName: (_) => OrderConfirmationScreen(),
        PersonalizeProductNameScreen.routeName: (_) => PersonalizeProductNameScreen(),
        GiftWrapScreen.routeName: (_) => GiftWrapScreen(),
        ChooseGiftWrapScreen.routeName: (_) => ChooseGiftWrapScreen(),
        CouponsScreen.routeName: (_) => CouponsScreen(),
        DeliveryLocationMapScreen.routeName: (_) => DeliveryLocationMapScreen(),
        DeliveryLocationSearchScreen.routeName: (_) => DeliveryLocationSearchScreen(),
        DeliveryTimeScreen.routeName: (_) => DeliveryTimeScreen(),
        DeliveryTypeScreen.routeName: (_) => DeliveryTypeScreen(),
        NewAddressScreen.routeName: (_) => NewAddressScreen(),
        OrderFailureScreen.routeName: (_) => OrderFailureScreen(),
        OrderSuccessScreen.routeName: (_) => OrderSuccessScreen(),
        DigitalCardsScreen.routeName: (_) => DigitalCardsScreen(),
        OrderHistoryScreen.routeName: (_) => OrderHistoryScreen(),
        OrderDetailsScreen.routeName: (_) => OrderDetailsScreen(),
        OrderDetailsInStoreScreen.routeName: (_) => OrderDetailsInStoreScreen(),
        OrderDetailsSelfPickUpScreen.routeName: (_) => OrderDetailsSelfPickUpScreen(),
        ContactUsScreen.routeName: (_) => ContactUsScreen(),
        ContactUsSuccessScreen.routeName: (_) => ContactUsSuccessScreen(),
        NotificationsScreen.routeName: (_) => NotificationsScreen(),
        ProfileScreen.routeName: (_) => ProfileScreen(),
        UserDetailsScreen.routeName: (_) => UserDetailsScreen(),
        SavedAddressScreen.routeName: (_) => SavedAddressScreen(),
        ScheduleAppointmentScreen.routeName: (_) => ScheduleAppointmentScreen(),
        FAQScreen.routeName: (_) => FAQScreen(),
        EnterDrawScreen.routeName: (_) => EnterDrawScreen(),
        ProductListingScreen.routeName: (_) => ProductListingScreen(),
        ProductListingSecondScreen.routeName: (_) => ProductListingSecondScreen(),
        CelebrityProductListingScreen.routeName: (_) => CelebrityProductListingScreen(),
        BrandProductListingScreen.routeName: (_) => BrandProductListingScreen(),
        GlobalFilterScreen.routeName: (_) => GlobalFilterScreen(),
        CompareProductsScreen.routeName: (_) => CompareProductsScreen(),
        StoryPreviewScreen.routeName: (_) => StoryPreviewScreen(),
        StoreLocatorScreen.routeName: (_) => StoreLocatorScreen(),
        StoreLocationMapViewScreen.routeName: (_) => StoreLocationMapViewScreen(),
        StoreDetailsScreen.routeName: (_) => StoreDetailsScreen(),
        ChipExpertsScreen.routeName: (_) => ChipExpertsScreen(),
        BrandListScreen.routeName: (_) => BrandListScreen(),
        SubCategoryListScreen.routeName: (_) => SubCategoryListScreen(),
        ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
        ProductDetailsSecondScreen.routeName: (_) => ProductDetailsSecondScreen(),
        CustomizeProductScreen.routeName: (_) => CustomizeProductScreen(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
