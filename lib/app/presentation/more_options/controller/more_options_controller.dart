import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreOptionsController extends GetxController {
  String name = prefs.getUsername();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void goToDataAndPrivacyPage() {
    Get.toNamed(AppRoutes.dataAndPrivacyPolicy);
  }

  void goToSettingsPage() {
    Get.toNamed(AppRoutes.settings);
  }

  void sendFeedback() {
    launchUrl(Uri(
      scheme: 'mailto',
      path: feedbackEmail,
      query: encodeQueryParameters(<String, String>{
        'subject': 'BudgetMate Feedback & Suggestions',
      }),
    ));
  }

  Future<void> inviteFriends() async {
    Share.share(await rootBundle.loadString('assets/text/share_to_friend.txt'));
  }

  void promptLogout() {
    Get.dialog(AlertDialog(
      title: const Text('Are you Sure?'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Do you Realy Want to Logout'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            logOut();
          },
        ),
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ));
    update();
  }

  void logOut() {
    var response = dioHelper.logout();
    response.then((value) {
      if (value!.statusCode == 200) {
        prefs.setUserLoggedIn(false);
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }
}
