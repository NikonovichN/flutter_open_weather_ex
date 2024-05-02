import '../../api.dart';
import '../entity/weather.dart';

abstract class WeatherRepository {
  Stream<List<WeatherDetails>> fetchWeatherData(WeatherQueryParams params);
}
