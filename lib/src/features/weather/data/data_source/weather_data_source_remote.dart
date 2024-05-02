import 'package:http/http.dart' as http;

import '../../api.dart';

abstract class WeatherDataSource {
  Future<http.Response> getData(WeatherQueryParams queryParams);
}

class WeatherDataSourceRemoteImpl implements WeatherDataSource {
  final WeatherAPI _weatherAPI;

  const WeatherDataSourceRemoteImpl({
    required WeatherAPI weatherAPI,
  }) : _weatherAPI = weatherAPI;

  @override
  Future<http.Response> getData(WeatherQueryParams queryParams) async {
    return http.get(
      Uri.https(
        _weatherAPI.getBaseURI,
        _weatherAPI.getWeatherPath,
        queryParams.getDataAsMap(),
      ),
    );
  }
}
