import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  // Obtain shared preferences.
  SharedPreferences? prefs;
  void setString(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    // C,U operation
    if (!prefs!.containsKey(key)) {
      prefs!.setString(key, value);
    }
  }

  Future<String> getString(String key) async {
    prefs = await SharedPreferences.getInstance();
    // R operation
    return prefs!.getString(key) ?? '';
  }
}
