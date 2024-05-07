import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String name;
  final String localizedName;
  final CoordinatesEntity coordinates;

  const CityEntity({required this.name, required this.localizedName, required this.coordinates});

  @override
  List<Object?> get props => [name, localizedName, coordinates];
}

class CoordinatesEntity extends Equatable {
  final double latitude;
  final double longitude;

  const CoordinatesEntity({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
