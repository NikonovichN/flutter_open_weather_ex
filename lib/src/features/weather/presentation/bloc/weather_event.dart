part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

final class UpdateWeatherDataByCityEvent extends WeatherEvent {
  final WeatherQueryParams? queryParams;

  const UpdateWeatherDataByCityEvent({required this.queryParams});

  @override
  List<Object?> get props => [queryParams];
}
