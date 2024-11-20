import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DataAndPrivacyPolicyController extends GetxController {
  void handleLinks(String url) {
    if (url.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
      launchUrl(Uri(
        scheme: 'mailto',
        path: url,
        query: encodeQueryParameters(<String, String>{
          'subject': 'Data & Privacy Policy Inquiry',
        }),
      ));
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}