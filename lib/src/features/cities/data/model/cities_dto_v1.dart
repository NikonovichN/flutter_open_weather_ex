import 'package:json_annotation/json_annotation.dart';

import 'coordinates_dto_v1.dart';

part 'cities_dto_v1.g.dart';

@JsonSerializable()
class CitiesDtoV1 {
  final String name;
  final String localizedName;
  final CoordinatesDtoV1 coordinates;

  const CitiesDtoV1({
    required this.name,
    required this.localizedName,
    required this.coordinates,
  });

  factory CitiesDtoV1.fromJson(Map<String, dynamic> json) => _$CitiesDtoV1FromJson(json);

  Map<String, dynamic> toJson() => _$CitiesDtoV1ToJson(this);
}
