// ignore: file_names

import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';

String BaseAPIAddress = "https://j82p739d-5001.euw.devtunnels.ms/";

class SharedPreferencesConstants {
  static var firstLaunch = "first_launch";
  static var userLoggedIn = "user_logged_in";
  static var loginUsername = "username";
  static var loginPassword = "password";
  static var currency = "currency";
}

Color maincolor = const Color(0xff358882);

String currency = prefs.getCurrency();

var feedbackEmail = "abdelrahman.hamdy.hashim@gmail.com";
