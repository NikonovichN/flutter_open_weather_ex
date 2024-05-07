import 'package:flutter_open_weather_ex/src/managers/shared_preferences_manager.dart';

abstract class LocaleDataSource {
  Future<String?> readLocale();
  Future<void> writeLocale(String cityJson);
}

class LocaleDataSourceLocalImpl implements LocaleDataSource {
  static const String _localeKey = 'locale';

  final SharedPreferencesManager _manager;

  LocaleDataSourceLocalImpl({required SharedPreferencesManager prefsManager})
      : _manager = prefsManager;

  @override
  Future<String?> readLocale() {
    return Future.value(_manager.readString(_localeKey));
  }

  @override
  Future<void> writeLocale(String locale) {
    return _manager.setString(_localeKey, locale);
  }
}
