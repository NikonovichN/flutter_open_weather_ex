part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherLoaded extends WeatherState {
  final WeatherDetailsState todayWeather;
  final List<WeatherDetailsState> nextDaysWeather;

  const WeatherLoaded({required this.todayWeather, required this.nextDaysWeather});

  @override
  List<Object> get props => [todayWeather, nextDaysWeather];
}

class WeatherDetailsState extends Equatable {
  final DateTime date;
  final String temp;
  final String tempFeelsLike;
  final String status;
  final String description;
  final String icon;

  const WeatherDetailsState({
    required this.date,
    required this.temp,
    required this.tempFeelsLike,
    required this.status,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        date,
        temp,
        tempFeelsLike,
        status,
        description,
        icon,
      ];
}

final class WeatherError extends WeatherState {
  const WeatherError();
}
