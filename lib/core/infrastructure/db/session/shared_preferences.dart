import 'package:shared_preferences/shared_preferences.dart' as library_shared_preferences;

class SharedPreferences {
  static const String keyToken = 'token';
  static const String keyRefreshToken = 'refreshToken';

  static final SharedPreferences _instance = SharedPreferences._internal();

  late library_shared_preferences.SharedPreferences _prefs;

  SharedPreferences._internal();

  factory SharedPreferences() {
    return _instance;
  }

  init() async {
    _prefs = await library_shared_preferences.SharedPreferences.getInstance();
  }

  void deletePreference({required String key}) async {
    await _prefs.remove(key);
  }

  void deletePreferences({required List<String> preferences}) async {
    for (String preference in preferences) {
      await _prefs.remove(preference);
    }
  }

  void deleteAllPreferences() async {
    await _prefs.clear();
  }

  // ? ----------- Add values here -----------

  String get token => _prefs.getString(keyToken) ?? '';

  set token(String value) {
    _prefs.setString(keyToken, value);
  }

  String get refreshToken => _prefs.getString(keyRefreshToken) ?? '';

  set refreshToken(String value) {
    _prefs.setString(keyRefreshToken, value);
  }
}
