// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_details_dto_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailsDtoV1 _$WeatherDetailsDtoV1FromJson(Map<String, dynamic> json) =>
    WeatherDetailsDtoV1(
      date: json['dt'] as num,
      main: MainWeatherInfoDtoV1.fromJson(json['main'] as Map<String, dynamic>),
      status: (json['weather'] as List<dynamic>)
          .map((e) => WeatherStatusDtoV1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDetailsDtoV1ToJson(
        WeatherDetailsDtoV1 instance) =>
    <String, dynamic>{
      'dt': instance.date,
      'main': instance.main,
      'weather': instance.status,
    };
