// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPreferenceUtil {
  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future setBool(String key, b) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, b);
  }

  static Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future setInt(String key, int i) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, i);
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future setString(String key, String s) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, s);
  }
}
