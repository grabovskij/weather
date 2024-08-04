import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/api/storage.dart';

class SharedStorage implements StorageApi {
  final SharedPreferences _preferences;

  SharedStorage(this._preferences);

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  Future<bool> setString({
    required String value,
    required String key,
  }) {
    return _preferences.setString(key, value);
  }
}
