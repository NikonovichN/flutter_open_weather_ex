// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather_info_dto_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeatherInfoDtoV1 _$MainWeatherInfoDtoV1FromJson(
        Map<String, dynamic> json) =>
    MainWeatherInfoDtoV1(
      temp: json['temp'] as num,
      tempFeelsLike: json['feels_like'] as num,
    );

Map<String, dynamic> _$MainWeatherInfoDtoV1ToJson(
        MainWeatherInfoDtoV1 instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.tempFeelsLike,
    };
