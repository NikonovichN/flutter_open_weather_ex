import 'dart:convert';

import 'package:either_dart/either.dart';

import '../model/cities_dto_v1.dart';
import '../model/coordinates_dto_v1.dart';
import '../../domain/entity/cities.dart';
import '../../domain/data/cities_repository.dart';
import '../data_source/city_data_source_local.dart';
import '../data_source/cities_data_source_remote.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesDataSource _citiesDataSource;
  final CityDataSource _cityDataSource;

  const CitiesRepositoryImpl({
    required CitiesDataSource dataSourceRemote,
    required CityDataSource cityDataSource,
  })  : _citiesDataSource = dataSourceRemote,
        _cityDataSource = cityDataSource;

  static const _errorCitiesString = 'Something went wrong! Failed to load cities!';
  static const _errorCityString = 'Something went wrong! Failed to load the city!';
  static const _errorWriteCityString =
      'Something went wrong! City has not been recorded in the local repository!';

  @override
  Future<Either<String, List<CityEntity>>> fetchCities() async {
    try {
      final response = await _citiesDataSource.fetchCities();

      if (response.statusCode != 200) {
        throw Exception();
      }

      final List decodeResponse = jsonDecode(response.body);
      final serializedResponse =
          decodeResponse.map((e) => CitiesDtoV1.fromJson(e).toEntity).toList();

      return Right(serializedResponse);
    } catch (_) {
      return const Left(_errorCitiesString);
    }
  }

  @override
  Future<Either<String, CityEntity?>> readSelectedCity() async {
    try {
      final response = await _cityDataSource.readSelectedCity();

      return Right(response == null ? null : CitiesDtoV1.fromJson(jsonDecode(response)).toEntity);
    } catch (_) {
      return const Left(_errorCityString);
    }
  }

  @override
  Future<Either<String, bool>> writeSelectedCity(CityEntity city) async {
    try {
      await _cityDataSource.writeSelectedCity(jsonEncode(city.toJson));
      return const Right(true);
    } catch (_) {
      return const Left(_errorWriteCityString);
    }
  }
}

extension on CitiesDtoV1 {
  CityEntity get toEntity =>
      CityEntity(name: name, localizedName: localizedName, coordinates: coordinates.toEntity);
}

extension on CoordinatesDtoV1 {
  CoordinatesEntity get toEntity => CoordinatesEntity(latitude: latitude, longitude: longitude);
}

extension on CityEntity {
  Map<String, dynamic> get toJson => CitiesDtoV1(
        coordinates: CoordinatesDtoV1(
          latitude: coordinates.latitude,
          longitude: coordinates.longitude,
        ),
        name: name,
        localizedName: localizedName,
      ).toJson();
}
