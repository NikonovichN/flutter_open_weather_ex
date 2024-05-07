import 'package:either_dart/either.dart';

import '../entity/cities.dart';

abstract class CitiesRepository {
  Future<Either<String, List<CityEntity>>> fetchCities();
  Future<Either<String, CityEntity?>> readSelectedCity();
  Future<Either<String, bool>> writeSelectedCity(CityEntity city);
}
