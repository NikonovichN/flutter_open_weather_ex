import 'package:flutter_open_weather_ex/src/features/cities/cities.dart';
import 'package:flutter_open_weather_ex/src/features/main_page/presentation/bloc/main_page_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/features.dart';

final GetIt injector = GetIt.instance;

class DependencyInjections {
  const DependencyInjections();

  Future<void> registerDependencies() async {
    // Stuff
    injector.registerSingleton<CitiesAPI>(CitiesApiImpl());

    // Data sources
    injector.registerSingleton<CitiesDataSourceRemote>(
        CitiesDataSourceRemoteImpl(citiesAPI: injector()));

    // Repositories
    injector
        .registerSingleton<CitiesRepository>(CitiesRepositoryImpl(dataSourceRemote: injector()));

    // Blocs
    injector.registerSingleton<CitiesBloc>(CitiesBloc(citiesRepository: injector()));
    injector.registerSingleton<MainPageBloc>(MainPageBloc(citiesBloc: injector()));
  }
}
