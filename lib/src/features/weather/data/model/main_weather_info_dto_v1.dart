// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

part 'main_weather_info_dto_v1.g.dart';

@JsonSerializable()
class MainWeatherInfoDtoV1 {
  final num temp;
  final num tempFeelsLike;

  const MainWeatherInfoDtoV1({
    required this.temp,
    @JsonKey(name: 'feels_like') required this.tempFeelsLike,
  });

  factory MainWeatherInfoDtoV1.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherInfoDtoV1FromJson(json);
}
