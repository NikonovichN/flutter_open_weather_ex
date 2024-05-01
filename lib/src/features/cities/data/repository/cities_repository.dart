import 'dart:convert';

import 'package:flutter_open_weather_ex/src/features/cities/data/model/cities_dto_v1.dart';
import 'package:flutter_open_weather_ex/src/features/cities/data/model/coordinates_dto_v1.dart';

import '../../domain/entity/cities.dart';
import '../../domain/data/cities_repository.dart';
import '../data_source/cities_data_source_remote.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesDataSourceRemote _dataSourceRemote;

  const CitiesRepositoryImpl({required CitiesDataSourceRemote dataSourceRemote})
      : _dataSourceRemote = dataSourceRemote;

  @override
  Stream<List<CityEntity>> fetchCities() async* {
    try {
      final response = await _dataSourceRemote.fetchCities();

      if (response.statusCode != 200) {
        throw Exception();
      }

      final List decodeResponse = jsonDecode(response.body);
      final serializedResponse =
          decodeResponse.map((e) => CitiesDtoV1.fromJson(e).toEntity).toList();

      yield* Stream.value(serializedResponse);
    } catch (_) {
      yield* Stream.error('Something went wrong!');
    }
  }

  @override
  Stream<CityEntity> readSelectedCity() {
    // TODO: implement readSelectedCity
    throw UnimplementedError();
  }

  @override
  Stream<void> writeSelectedCity(CityEntity city) {
    // TODO: implement writeSelectedCity
    throw UnimplementedError();
  }
}

extension on CitiesDtoV1 {
  CityEntity get toEntity => CityEntity(name: name, coordinates: coordinates.toEntity);
}

extension on CoordinatesDtoV1 {
  CoordinatesEntity get toEntity => CoordinatesEntity(latitude: latitude, longitude: longitude);
}
