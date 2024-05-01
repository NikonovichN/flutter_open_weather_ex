// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_dto_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesDtoV1 _$CoordinatesDtoV1FromJson(Map<String, dynamic> json) =>
    CoordinatesDtoV1(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesDtoV1ToJson(CoordinatesDtoV1 instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
