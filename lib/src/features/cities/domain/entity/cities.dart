import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String name;
  final CoordinatesEntity coordinates;

  const CityEntity({required this.name, required this.coordinates});

  @override
  List<Object?> get props => [name, coordinates];
}

class CoordinatesEntity extends Equatable {
  final double latitude;
  final double longitude;

  const CoordinatesEntity({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
