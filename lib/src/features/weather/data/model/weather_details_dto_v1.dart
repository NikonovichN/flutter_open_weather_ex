import 'package:json_annotation/json_annotation.dart';

import 'weather_status_dto_v1.dart';
import 'main_weather_info_dto_v1.dart';

part 'weather_details_dto_v1.g.dart';

@JsonSerializable()
class WeatherDetailsDtoV1 {
  @JsonKey(name: 'dt')
  final num date;

  final MainWeatherInfoDtoV1 main;

  @JsonKey(name: 'weather')
  final List<WeatherStatusDtoV1> status;

  const WeatherDetailsDtoV1({
    required this.date,
    required this.main,
    required this.status,
  });

  factory WeatherDetailsDtoV1.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsDtoV1FromJson(json);
}
