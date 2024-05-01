abstract class CitiesAPI {
  String get getSecretKey;
  String get getBaseURI;
  String get getCitiesPath;
  String get getDefaultCountry;
  String get getDefaultLimitOfCities;
}

class CitiesApiImpl implements CitiesAPI {
  static const secretKey = '98c77f2e1bmsh9467157beede6fbp1339ecjsn08f93dee3885';

  static const baseURI = 'spott.p.rapidapi.com';

  static const citiesPath = 'places/autocomplete';

  static const defaultCountry = 'BY';

  static const defaultLimitOfCities = '30';

  @override
  String get getSecretKey => secretKey;

  @override
  String get getBaseURI => baseURI;

  @override
  String get getCitiesPath => citiesPath;

  @override
  String get getDefaultCountry => defaultCountry;

  @override
  String get getDefaultLimitOfCities => defaultLimitOfCities;
}
