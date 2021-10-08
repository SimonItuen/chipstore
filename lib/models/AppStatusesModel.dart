import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStatusesModel{
  final String coverUrl;
  final String title;
  final Color color;
  final int count;
  

  AppStatusesModel({required this.coverUrl, required this.color, required this.count,  required this.title});
}

List<AppStatusesModel> demoStatusList = [
  AppStatusesModel(
      coverUrl: 'assets/images/demo/phones.png', title: 'Daily\nDeals', color: Color(0XFF005470), count: 9),
  AppStatusesModel(
      coverUrl: 'assets/images/demo/laptops.png', title: 'Most Wanted', color: Color(0XFFee982c), count: 37),
  AppStatusesModel(
      coverUrl: 'assets/images/demo/smart_watches.png', title: 'Last Chance to Buy', color: Color(0XFF005470), count: 13),
  AppStatusesModel(
      coverUrl: 'assets/images/demo/headphones.png', title: 'Express Delivery', color: Color(0XFF005470), count: 4),
  AppStatusesModel(
      coverUrl: 'assets/images/demo/bagpacks.png', title: 'Limited Quantity', color: Color(0XFF005470), count: 19),

];

