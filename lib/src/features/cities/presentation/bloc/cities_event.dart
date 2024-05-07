part of 'cities_bloc.dart';

sealed class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

final class LoadCitiesDataEvent extends CitiesEvent {
  const LoadCitiesDataEvent();
}

final class LoadSelectedCityEvent extends CitiesEvent {
  const LoadSelectedCityEvent();
}

final class SaveCityEvent extends CitiesEvent {
  final CityEntity cityEntity;

  const SaveCityEvent({required this.cityEntity});

  @override
  List<Object> get props => [cityEntity];
}
