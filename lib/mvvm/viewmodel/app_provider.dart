import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/theme/theme_config.dart';
import 'package:flutter/material.dart';

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

  void setTheme(themeValue, valueSavePref) async {
    theme = themeValue;
    await SharedPreferencesService().setString('theme', valueSavePref);
    notifyListeners();
  }

  ThemeData checkTheme() {
    ThemeData themeData;
    String themeKey = SharedPreferencesService().getString('theme') ?? 'light';
    if (themeKey == 'light') {
      themeData = ThemeConfig.lightTheme;
    } else {
      themeData = ThemeConfig.darkTheme;
    }
    return themeData;
  }

  void setLanguage(String langCode) async {
    languageCode = langCode;
    currentLocale = S.delegate.supportedLocales
        .firstWhere((locale) => locale.languageCode == langCode);
    await SharedPreferencesService().setString('langCode', langCode);
    notifyListeners();
  }

  String checkLanguage() {
    String langCode = SharedPreferencesService().getString('langCode') ?? 'vi';
    return langCode;
  }
}
