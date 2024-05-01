part of 'cities_bloc.dart';

sealed class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

final class LoadCitiesDataEvent extends CitiesEvent {
  const LoadCitiesDataEvent();

  @override
  List<Object> get props => [];
}
