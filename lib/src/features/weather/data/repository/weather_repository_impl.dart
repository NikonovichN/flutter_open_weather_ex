import 'dart:convert';

import 'package:http/http.dart';

import '../../api.dart';
import '../model/model.dart';
import '../../domain/entity/weather.dart';
import '../../domain/data/weather_repository.dart';
import '../data_source/weather_data_source_remote.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSourceRemote;

  const WeatherRepositoryImpl({
    required WeatherDataSource dataSourceRemote,
  }) : _dataSourceRemote = dataSourceRemote;

  @override
  Stream<List<WeatherDetailsEntity>> fetchWeatherData(WeatherQueryParams queryParams) async* {
    try {
      final Response response = await _dataSourceRemote.getData(queryParams);

      if (response.statusCode != 200) {
        throw Exception();
      }
      yield* Stream.value(ListWeatherDetailsDtoV1.fromJson(jsonDecode(response.body)).toEntity);
    } catch (_) {
      yield* Stream.error('Something went wrong! Fails to get weather data!');
    }
  }
}

extension on ListWeatherDetailsDtoV1 {
  List<WeatherDetailsEntity> get toEntity => list.map((e) => e.toEntity).toList();
}

extension on WeatherDetailsDtoV1 {
  WeatherDetailsEntity get toEntity => WeatherDetailsEntity(
        date: DateTime.fromMillisecondsSinceEpoch(date.toInt() * 1000),
        main: main.toEntity,
        status: status.map((e) => e.toEntity).toList(),
      );
}

extension on MainWeatherInfoDtoV1 {
  MainWeatherInfoEntity get toEntity =>
      MainWeatherInfoEntity(temp: temp, tempFeelsLike: tempFeelsLike);
}

extension on WeatherStatusDtoV1 {
  WeatherStatusEntity get toEntity =>
      WeatherStatusEntity(description: description, icon: icon, main: main);
}
