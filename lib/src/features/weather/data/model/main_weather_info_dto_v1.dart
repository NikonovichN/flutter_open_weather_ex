import 'package:json_annotation/json_annotation.dart';

part 'main_weather_info_dto_v1.g.dart';

@JsonSerializable()
class MainWeatherInfoDtoV1 {
  final num temp;

  @JsonKey(name: 'feels_like')
  final num tempFeelsLike;

  const MainWeatherInfoDtoV1({
    required this.temp,
    required this.tempFeelsLike,
  });

  factory MainWeatherInfoDtoV1.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherInfoDtoV1FromJson(json);
}
