import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class LoginController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passwordVisible = false.obs;
  String? usernameError;
  String? passwordError;

  validateUsername(String username) {
    if (username.isEmpty) {
      usernameError = 'Can\'t be empty';
    } else {
      usernameError = null;
    }
    update();
    return usernameError;
  }

  validatePassword(String password) {
    if (password.isEmpty) {
      passwordError = 'Can\'t be empty';
    } else {
      passwordError = null;
    }
    update();
    return passwordError;
  }

  changePassVisibility() {
    passwordVisible.value = !passwordVisible.value;
    update();
  }
}
