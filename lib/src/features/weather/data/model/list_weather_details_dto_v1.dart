// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'weather_details_dto_v1.dart';

part 'list_weather_details_dto_v1.g.dart';

@JsonSerializable()
class ListWeatherDetailsDtoV1 {
  final List<WeatherDetailsDtoV1> data;

  const ListWeatherDetailsDtoV1({
    @JsonKey(name: 'list') required this.data,
  });

  factory ListWeatherDetailsDtoV1.fromJson(Map<String, dynamic> json) =>
      _$ListWeatherDetailsDtoV1FromJson(json);
}
