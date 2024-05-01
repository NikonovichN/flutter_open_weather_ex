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
}

final class CitiesError extends CitiesState {}
