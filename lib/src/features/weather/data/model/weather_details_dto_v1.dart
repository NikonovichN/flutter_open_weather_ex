// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'weather_status_dto_v1.dart';
import 'main_weather_info_dto_v1.dart';

part 'weather_details_dto_v1.g.dart';

@JsonSerializable()
class WeatherDetailsDtoV1 {
  final DateTime date;
  final MainWeatherInfoDtoV1 main;
  final List<WeatherStatusDtoV1> status;

  const WeatherDetailsDtoV1({
    @JsonKey(name: 'dt') required this.date,
    required this.main,
    @JsonKey(name: 'weather') required this.status,
  });

  factory WeatherDetailsDtoV1.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsDtoV1FromJson(json);
}
