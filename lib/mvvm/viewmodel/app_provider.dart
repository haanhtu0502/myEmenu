import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class AppProvider extends ChangeNotifier {
  AppProvider() {
    initData();
  }

  void initData() async {
    theme = checkTheme();
    languageCode = checkLanguage();
    currentLocale = S.delegate.supportedLocales
        .firstWhere((locale) => locale.languageCode == languageCode);
    notifyListeners();
  }

  Key? key = UniqueKey();
  ThemeData theme = ThemeConfig.lightTheme;
  String languageCode = 'vi';
  Locale currentLocale = const Locale('vi', '');
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String? customerName;
  String? customerPhone;

  void setTheme(themeValue, valueSavePref) {
    theme = themeValue;
    SharedPreferencesService.setString('theme', valueSavePref);
    notifyListeners();
  }

  ThemeData checkTheme() {
    ThemeData themeData;
    String themeKey = SharedPreferencesService.getString('theme') ?? 'light';
    if (themeKey == 'light') {
      themeData = ThemeConfig.lightTheme;
    } else {
      themeData = ThemeConfig.darkTheme;
    }
    return themeData;
  }

  void setLanguage(String langCode) {
    languageCode = langCode;
    currentLocale = S.delegate.supportedLocales
        .firstWhere((locale) => locale.languageCode == langCode);
    SharedPreferencesService.setString('langCode', langCode);
    notifyListeners();
  }

  String checkLanguage() {
    String langCode = SharedPreferencesService.getString('langCode') ?? 'vi';
    return langCode;
  }

  void setCustomerName(String name) {
    customerName = name;
    notifyListeners();
  }

  void setCustomerPhone(String phone) {
    customerPhone = phone;
    notifyListeners();
  }

  bool get isLogin => customerName != null && customerPhone != null;
}
