import 'package:budgetmate/main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class oneTimeWelcomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    prefs.setFirstLaunchFalse();
  }

  
}
