import 'package:flutter_open_weather_ex/src/features/cities/domain/entity/cities.dart';

abstract class CitiesRepository {
  Stream<CitiesEntity> read();
  Future<void> updateLastCity(CityEntity city);
}
