import 'package:equatable/equatable.dart';

class WeatherDetails extends Equatable {
  final DateTime date;
  final MainWeatherInfo main;
  final List<WeatherStatus> status;

  const WeatherDetails({
    required this.date,
    required this.main,
    required this.status,
  });

  @override
  List<Object?> get props => [date, main, status];
}

class MainWeatherInfo extends Equatable {
  final num temp;

  const MainWeatherInfo({required this.temp});

  @override
  List<Object?> get props => [temp];
}

class WeatherStatus extends Equatable {
  final String main;
  final String description;
  final String icon;

  const WeatherStatus({
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [main, description, icon];
}
