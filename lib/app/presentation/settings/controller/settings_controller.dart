import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  List<DropdownMenuItem> currencyList = [
    DropdownMenuItem(value: "\$", child: Text("Dollar")),
    DropdownMenuItem(value: "EGP", child: Text("Egyptian Pound"))
  ];

  String currencyValue = prefs.getCurrency();

  void setCurrency(String currency) {
    prefs.setCurrency(currency);
    currencyValue = currency;
    update();
  }
}
