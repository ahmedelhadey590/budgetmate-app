import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:budgetmate/main.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Map<String, dynamic> dashboard = {};

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(prefs.isFirstLaunch()
          ? AppRoutes.oneTimeWelcome
          : prefs.isUserLoggedIn()
              ? AppRoutes.dashboard
              : AppRoutes.login);
    });
  }
}
