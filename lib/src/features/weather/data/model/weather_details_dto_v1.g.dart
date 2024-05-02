// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_details_dto_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailsDtoV1 _$WeatherDetailsDtoV1FromJson(Map<String, dynamic> json) =>
    WeatherDetailsDtoV1(
      date: DateTime.parse(json['date'] as String),
      main: MainWeatherInfoDtoV1.fromJson(json['main'] as Map<String, dynamic>),
      status: (json['status'] as List<dynamic>)
          .map((e) => WeatherStatusDtoV1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDetailsDtoV1ToJson(
        WeatherDetailsDtoV1 instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'main': instance.main,
      'status': instance.status,
    };
