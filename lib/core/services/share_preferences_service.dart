import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._();
  late final SharedPreferences? _prefs;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._();

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  void setString(String key, String value) {
    _prefs?.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  void setBool(String key, bool value) {
    _prefs?.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  void remove(String key) {
    _prefs?.remove(key);
  }
}
