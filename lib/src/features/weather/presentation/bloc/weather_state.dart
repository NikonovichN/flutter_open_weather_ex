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
  final WeatherDetails todayWeather;
  final List<WeatherDetails> nextDaysWeather;

  const WeatherLoaded({required this.todayWeather, required this.nextDaysWeather});

  @override
  List<Object> get props => [todayWeather, nextDaysWeather];
}

final class WeatherError extends WeatherState {
  const WeatherError();
}
