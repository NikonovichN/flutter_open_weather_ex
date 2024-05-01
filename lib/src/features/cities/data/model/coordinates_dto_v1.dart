import 'package:json_annotation/json_annotation.dart';

part 'coordinates_dto_v1.g.dart';

@JsonSerializable()
class CoordinatesDtoV1 {
  final double latitude;
  final double longitude;

  const CoordinatesDtoV1({required this.latitude, required this.longitude});

  factory CoordinatesDtoV1.fromJson(Map<String, dynamic> json) => _$CoordinatesDtoV1FromJson(json);
}
