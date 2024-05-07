import 'package:either_dart/either.dart';

import '../../api.dart';
import '../entity/weather.dart';

abstract class WeatherRepository {
  Future<Either<String, List<WeatherDetailsEntity>>> fetchWeatherData(WeatherQueryParams params);
}
