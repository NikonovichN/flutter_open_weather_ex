import '../entity/cities.dart';

abstract class CitiesRepository {
  Stream<List<CityEntity>> fetchCities();
  Stream<CityEntity?> readSelectedCity();
  Future<void> writeSelectedCity(CityEntity city);
}
