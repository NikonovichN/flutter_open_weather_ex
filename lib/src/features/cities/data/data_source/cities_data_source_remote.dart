import 'package:http/http.dart' as http;

import 'package:flutter_open_weather_ex/src/features/cities/api.dart';

abstract class CitiesDataSource {
  Future<http.Response> fetchCities();
}

class CitiesDataSourceRemoteImpl implements CitiesDataSource {
  final CitiesAPI _citiesAPI;

  const CitiesDataSourceRemoteImpl({
    required CitiesAPI citiesAPI,
  }) : _citiesAPI = citiesAPI;

  @override
  Future<http.Response> fetchCities() async {
    return await http.get(
      Uri.https(_citiesAPI.getBaseURI, _citiesAPI.getCitiesPath, {
        'limit': _citiesAPI.getDefaultLimitOfCities,
        'country': _citiesAPI.getDefaultCountry,
        'type': 'CITY',
      }),
      headers: {
        "X-RapidAPI-Host": _citiesAPI.getBaseURI,
        "X-RapidAPI-Key": _citiesAPI.getSecretKey,
      },
    );
  }
}
