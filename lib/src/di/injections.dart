import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/features.dart';
import '../managers/shared_preferences_manager.dart';

final GetIt injector = GetIt.instance;

class DependencyInjections {
  const DependencyInjections();

  Future<void> registerDependencies() async {
    // Stuff
    injector.registerSingleton<CitiesAPI>(CitiesApiImpl());
    injector.registerSingleton<WeatherAPI>(WeatherApiImpl());
    injector.registerSingleton<SharedPreferencesManager>(
      SharedPreferencesManagerImpl(prefs: await SharedPreferences.getInstance()),
    );

    // Data sources
    injector.registerSingleton<CitiesDataSource>(CitiesDataSourceRemoteImpl(citiesAPI: injector()));
    injector.registerSingleton<CityDataSource>(CityDataSourceLocalImpl(prefsManager: injector()));
    injector.registerSingleton<WeatherDataSource>(
      WeatherDataSourceRemoteImpl(weatherAPI: injector()),
    );

    // Repositories
    injector.registerSingleton<CitiesRepository>(
      CitiesRepositoryImpl(dataSourceRemote: injector(), cityDataSource: injector()),
    );
    injector.registerSingleton<WeatherRepository>(
      WeatherRepositoryImpl(dataSourceRemote: injector()),
    );

    // Blocs
    injector.registerSingleton<CitiesBloc>(CitiesBloc(citiesRepository: injector()));
    injector.registerSingleton<WeatherBloc>(WeatherBloc(weatherRepository: injector()));
  }
}
