import 'package:chipstore_app/models/LanguageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  int currentScreen=0;
  bool isLoggedIn= false;
  LanguageModel currentLanguage = LanguageModel(flagUrl: 'assets/images/arabic_flag.png', title: 'العربية');
  List<String> allFilterList=[];
  List<String> myProductsFilterList=[];

  void setCurrentScreen(int screen) {
    currentScreen = screen;
    notifyListeners();
  }

  int get getCurrentScreen {
    return currentScreen;
  }

  void setCurrentLanguage(LanguageModel language) {
    currentLanguage = language;
    notifyListeners();
  }
  bool get getIsLoggedIn {
    return isLoggedIn;
  }

  void setIsLoggedIn(bool value) {
    isLoggedIn = value;
    notifyListeners();
  }

  LanguageModel get getCurrentLanguage {
    return currentLanguage;
  }
}
