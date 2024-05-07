// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_dto_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesDtoV1 _$CitiesDtoV1FromJson(Map<String, dynamic> json) => CitiesDtoV1(
      name: json['name'] as String,
      localizedName: json['localizedName'] as String,
      coordinates: CoordinatesDtoV1.fromJson(
          json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CitiesDtoV1ToJson(CitiesDtoV1 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'localizedName': instance.localizedName,
      'coordinates': instance.coordinates,
    };
