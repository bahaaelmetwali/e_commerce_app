import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@singleton
class CacheHelper {
  SharedPreferences _preferences;
  CacheHelper(this._preferences);
  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }


  String? getString(String key) {
    return _preferences.getString(key);
  }
}
