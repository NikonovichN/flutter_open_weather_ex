import 'package:flutter_open_weather_ex/src/features/cities/domain/entity/cities.dart';

abstract class CitiesRepository {
  Stream<List<CityEntity>> fetchCities();
  Stream<CityEntity?> readSelectedCity();
  Future<void> writeSelectedCity(CityEntity city);
}
