// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_status_dto_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherStatusDtoV1 _$WeatherStatusDtoV1FromJson(Map<String, dynamic> json) =>
    WeatherStatusDtoV1(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherStatusDtoV1ToJson(WeatherStatusDtoV1 instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
