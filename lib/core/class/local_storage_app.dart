import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageApp {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  static getData(String key) {
    return sharedPreferences.getString(key);
  }
}
