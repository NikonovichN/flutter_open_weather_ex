import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/cities.dart';
import '../../domain/data/cities_repository.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final CitiesRepository _repository;

  CitiesBloc({required CitiesRepository citiesRepository})
      : _repository = citiesRepository,
        super(CitiesInitial()) {
    on<LoadCitiesDataEvent>(_loadCitiesDataEvent);
  }

  Future<void> _loadCitiesDataEvent(LoadCitiesDataEvent event, Emitter emit) async {
    emit(CitiesLoading());

    final citiesStream = _repository.fetchCities();

    await emit.forEach(
      citiesStream,
      onData: (List<CityEntity> cities) => CitiesLoaded(cities: cities),
      onError: (error, _) => CitiesError(),
    );
  }
}
