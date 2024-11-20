import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isFirstLaunch() {
    return _prefs?.getBool(SharedPreferencesConstants.firstLaunch) ?? true;
  }

  // Set first launch flag to false
  Future<void> setFirstLaunchFalse() async {
    await _prefs?.setBool(SharedPreferencesConstants.firstLaunch, false);
  }

  Future<void> setUserLoggedIn(bool status) async {
    await _prefs?.setBool(SharedPreferencesConstants.userLoggedIn, status);
  }

  bool isUserLoggedIn() {
    return _prefs?.getBool(SharedPreferencesConstants.userLoggedIn) ?? false;
  }

  Future<void> setLoginCredentials(String username, String password) async {
    await _prefs?.setString(SharedPreferencesConstants.loginUsername, username);
    await _prefs?.setString(SharedPreferencesConstants.loginPassword, password);
  }

  Future<Map<String, String>> getLoginCredentials() async {
    var username =
        _prefs?.getString(SharedPreferencesConstants.loginUsername) ?? "";
    var password =
        _prefs?.getString(SharedPreferencesConstants.loginPassword) ?? "";

    return {"Username": username, "Password": password};
  }

  String getUsername() {
    var username =
        _prefs?.getString(SharedPreferencesConstants.loginUsername) ?? "";

    return username;
  }

  Future<void> setCurrency(String currency) async {
    await _prefs?.setString(SharedPreferencesConstants.currency, currency);
    print('currency sat to $currency');
  }

  String getCurrency() {
    var currency =
        _prefs?.getString(SharedPreferencesConstants.currency) ?? "\$";
    if (currency == "") {
      currency = "\$";
    }
    return currency;
  }
}
