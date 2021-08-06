// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class ConfigHelper {
  static late SharedPreferences prefs;

  static int getThemeMode() {
    return prefs.getInt("themeMode") ?? 0;
  }

  static void setThemeMode(int value) {
    prefs.setInt("themeModel", 0);
  }

  static int getAppTheme() {
    return prefs.getInt("themeColor") ?? 0;
  }

  static void setAppTheme(int value) {
    prefs.setInt("themeColor", value);
  }

  static bool getUserIsLogined() {
    return prefs.getBool("isLogin") ?? false;
  }

  static void setUserIsLogined(bool value) {
    prefs.setBool("isLogin", value);
  }
}