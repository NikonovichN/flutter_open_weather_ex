// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_weather_details_dto_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWeatherDetailsDtoV1 _$ListWeatherDetailsDtoV1FromJson(
        Map<String, dynamic> json) =>
    ListWeatherDetailsDtoV1(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherDetailsDtoV1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWeatherDetailsDtoV1ToJson(
        ListWeatherDetailsDtoV1 instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
