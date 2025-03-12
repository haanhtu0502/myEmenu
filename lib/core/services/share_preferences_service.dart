import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._();
  static late final SharedPreferences prefs;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setString(String key, String value) {
    prefs.setString(key, value);
  }

  static String? getString(String key) {
    return prefs.getString(key);
  }

  static void setBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  static void remove(String key) {
    prefs.remove(key);
  }
}

class CommonAppSettingPref {
  static const String _accessToken = "_accessToken";

  static void setAccessToken(String value) {
    return SharedPreferencesService.setString(_accessToken, value);
  }

  static String getAccessToken() {
    return SharedPreferencesService.getString(_accessToken) ?? "";
  }
}
