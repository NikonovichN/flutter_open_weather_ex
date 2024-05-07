import 'package:flutter_open_weather_ex/src/managers/shared_preferences_manager.dart';

abstract class CityDataSource {
  Future<String?> readSelectedCity();
  Future<void> writeSelectedCity(String cityJson);
}

class CityDataSourceLocalImpl implements CityDataSource {
  static const String _localCityKey = 'selectedCity';

  final SharedPreferencesManager _manager;

  CityDataSourceLocalImpl({required SharedPreferencesManager prefsManager})
      : _manager = prefsManager;

  @override
  Future<String?> readSelectedCity() {
    return Future.value(_manager.readString(_localCityKey));
  }

  @override
  Future<void> writeSelectedCity(String cityJson) {
    return _manager.setString(_localCityKey, cityJson);
  }
}
