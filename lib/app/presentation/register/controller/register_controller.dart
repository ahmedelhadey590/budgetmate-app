import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  RxBool passwordVisible = false.obs;
  String? usernameError;
  String? emailError;
  String? passwordError;
  String? passwordConfirmationError;

  validateUsername(String username) {
    if (username.isEmpty) {
      usernameError = 'Can\'t be empty';
    } else {
      usernameError = null;
    }
    update();
    return usernameError;
  }

  validateEmail(String email) {
    var emailValid = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);
    if (!emailValid || email.isEmpty) {
      emailError = "Not a valid Email";
    } else {
      emailError = null;
    }
    update();
    return emailError;
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

  validatePasswordConfirmation(String passwordConfirmation) {
    if (passwordConfirmation.isEmpty) {
      passwordError = 'Can\'t be empty';
    } else if (passwordConfirmation != passwordController.text) {
      passwordError = 'Password and Confirmation Missmatch';
    } else {
      passwordError = null;
    }
    update();
    return passwordError;
  }
}
