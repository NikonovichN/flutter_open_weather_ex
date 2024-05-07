import 'package:equatable/equatable.dart';

class WeatherDetailsEntity extends Equatable {
  final DateTime date;
  final MainWeatherInfoEntity main;
  final List<WeatherStatusEntity> status;

  const WeatherDetailsEntity({
    required this.date,
    required this.main,
    required this.status,
  });

  @override
  List<Object?> get props => [date, main, status];
}

class MainWeatherInfoEntity extends Equatable {
  final num temp;
  final num tempFeelsLike;

  const MainWeatherInfoEntity({required this.temp, required this.tempFeelsLike});

  @override
  List<Object?> get props => [temp];
}

class WeatherStatusEntity extends Equatable {
  final String main;
  final String description;
  final String icon;

  const WeatherStatusEntity({
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [main, description, icon];
}
