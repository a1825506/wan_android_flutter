import 'package:shared_preferences/shared_preferences.dart';

class SpUtils{
  static Future<String?> getString(String key) async{
    final sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static Future<void> setString(String key,String value) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<void> remove(String key) async {
    final sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static Future<void> clear() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
