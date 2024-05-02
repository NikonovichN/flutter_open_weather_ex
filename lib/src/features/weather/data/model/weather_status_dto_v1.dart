import 'package:json_annotation/json_annotation.dart';

part 'weather_status_dto_v1.g.dart';

@JsonSerializable()
class WeatherStatusDtoV1 {
  final String main;
  final String description;
  final String icon;

  WeatherStatusDtoV1({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherStatusDtoV1.fromJson(Map<String, dynamic> json) =>
      _$WeatherStatusDtoV1FromJson(json);
}
