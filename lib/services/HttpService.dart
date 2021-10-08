import 'dart:async';
import 'dart:io';

import 'package:chipstore_app/util/session_manager_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpService {
  static final String baseUrl = "https://aayan.creativity.com.kw/api/v1";

  static late HttpService _httpService;

  static Future<HttpService> getInstance() async {
    if (_httpService == null) {
      // keep local instance till it is fully initialized.
      _httpService = HttpService._();
      await SessionManagerUtil.getInstance();
    }
    return _httpService;
  }

  HttpService._();

  static Future<bool> searchArea(BuildContext context, {
    String text='',
    String lang = 'en'
  }) async {
    await SessionManagerUtil.getInstance();
    String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&types=address&language=$lang&components=country:kw&key=AIzaSyAomNQd985ygmIU1xQef988l9yPYIiKPeU';
    print(url);
    try {
      http.Response response =
      await http.get(Uri.parse(url), headers: null);
          print(response.statusCode.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
    final result = convert.jsonDecode(response.body);
    if (result['status'] == 'OK') {
    // compose suggestions in a list
      print(result['predictions'][0]);
    /*return result['predictions']
        .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
        .toList();*/
    }
    if (result['status'] == 'ZERO_RESULTS') {
      _showResponseSnackBar(
        context,result['status']);
    /*return [];*/
    }

    /*UserModel model = UserModel.fromJson(jsonResponse);*/
    /* Provider.of<AppProvider>(context, listen: false)
            .setUserModel(model);
        SessionManagerUtil.putString('username', model.username);
        SessionManagerUtil.putString('email', model.email);
        SessionManagerUtil.putString('token', model.token);
        SessionManagerUtil.putString('id', model.id);
        _navigateRoute(context, RegisterScreen.routeName);*/
    } else {
    var jsonResponse = convert.jsonDecode(response.body);
    if (jsonResponse.toString().isNotEmpty) {
    _showResponseSnackBar(
    context,
    jsonResponse['message']
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .replaceAll('[', '')
        .replaceAll(']', ''));
    } else {
    _showResponseSnackBar(context,
    'Couldn\'t Connect Please Try Again');
    }
    }
    } on TimeoutException catch (e) {
    _showResponseSnackBar(
    context, 'No Internet Connection');
    } on SocketException catch (e) {
    _showResponseSnackBar(
    context, 'No Connection With Server');
    } on Error catch (e) {
    print(e);
    _showResponseSnackBar(
    context, 'Something Went Wrong');
    }

    return
    false;
  }

  static void _showResponseSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
        content: Text(
          '$message',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme
                  .of(context)
                  .cardColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Theme
            .of(context)
            .primaryColor);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void _navigateRoute(BuildContext context, String route) {
    /**This Navigates push Replacement thus popping the current screen off the navigation stack*/
    Navigator.of(context).pushReplacementNamed(route);
  }
}