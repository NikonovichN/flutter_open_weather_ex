abstract class WeatherAPI {
  String get getSecretKey;
  String get getBaseURI;
  String get getWeatherPath;
}

class WeatherApiImpl implements WeatherAPI {
  static const secretKey = 'e8a27a6517a79a986f247c69b90f0dfc';

  static const baseURI = 'api.openweathermap.org';

  static const weatherPath = 'data/2.5/forecast';

  @override
  get getSecretKey => secretKey;

  @override
  String get getBaseURI => baseURI;

  @override
  String get getWeatherPath => weatherPath;
}

class WeatherQueryParams {
  final String lat;
  final String lon;
  final String units;
  final String appid;

  const WeatherQueryParams({
    required this.lat,
    required this.lon,
    required this.units,
    required this.appid,
  });

  Map<String, String> getDataAsMap() => {
        'lat': lat,
        'lon': lon,
        'units': units,
        'appid': appid,
      };
}
