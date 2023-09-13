import 'package:shared_preferences/shared_preferences.dart';

class PrivacyConfigRepository {
  static const String _dark = "dark";

  final SharedPreferences _preferences;

  PrivacyConfigRepository(this._preferences);

  Future<void> setDark(bool value) async {
    _preferences.setBool(_dark, value);
  }

  bool isDark() {
    return _preferences.getBool(_dark) ?? false;
  }
}
