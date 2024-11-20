import 'package:budgetmate/app/presentation/personal_profile/model/UserProfile.dart';
import 'package:budgetmate/main.dart';
import 'package:get/get.dart' hide Response;
import 'package:intl/intl.dart';

class PersonalProfileController extends GetxController {
  UserProfile? userProfile;
  bool dataPresent = false;
  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm a');

  Future getUserProfile() async {
    var res = await dioHelper.getUserProfile();
    userProfile = UserProfile.fromJson(res!.data);
    update();
    return userProfile;
  }

  setDataPresent(bool value) {
    dataPresent = value;
    update();
  }
}
