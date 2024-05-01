import 'package:get_it/get_it.dart';

import '../features/features.dart';

final GetIt injector = GetIt.instance;

class DependencyInjections {
  const DependencyInjections();

  Future<void> registerDependencies() async {
    // Stuff
    injector.registerSingleton<CitiesAPI>(CitiesApiImpl());

    // Data sources

    // Repositories

    // UseCases

    // Blocs
  }
}
