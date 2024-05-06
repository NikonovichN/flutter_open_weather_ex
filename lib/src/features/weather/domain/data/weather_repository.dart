import '../../api.dart';
import '../entity/weather.dart';

abstract class WeatherRepository {
  Stream<List<WeatherDetailsEntity>> fetchWeatherData(WeatherQueryParams params);
}
