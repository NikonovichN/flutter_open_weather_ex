part of 'cities_bloc.dart';

sealed class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object> get props => [];
}

final class CitiesInitial extends CitiesState {}

final class CitiesLoading extends CitiesState {}

final class CitiesLoaded extends CitiesState {
  final CityEntity? selectedCity;
  final List<CityEntity> cities;

  const CitiesLoaded({this.selectedCity, required this.cities});

  @override
  List<Object> get props => [selectedCity ?? {}, cities];

  CitiesLoaded copyWith({
    CityEntity? selectedCity,
    List<CityEntity>? cities,
  }) {
    return CitiesLoaded(
      cities: cities ?? this.cities,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}

final class CitiesError extends CitiesState {}
