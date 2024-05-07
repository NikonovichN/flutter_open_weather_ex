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
    on<LoadSelectedCityEvent>(_loadSelectedCityEvent);
    on<SaveCityEvent>(_saveCityEvent);
  }

  Future<void> _loadCitiesDataEvent(LoadCitiesDataEvent event, Emitter emit) async {
    emit(CitiesLoading());

    final citiesResponse = await _repository.fetchCities();

    emit(citiesResponse.fold(
      (_) => CitiesError(),
      (List<CityEntity> cities) => CitiesLoaded(cities: cities),
    ));

    add(const LoadSelectedCityEvent());
  }

  Future<void> _loadSelectedCityEvent(LoadSelectedCityEvent event, Emitter emit) async {
    if (state is CitiesLoaded) {
      final cityResponse = await _repository.readSelectedCity();
      cityResponse.map((city) {
        emit((state as CitiesLoaded).copyWith(selectedCity: city));
      });
    }
  }

  Future<void> _saveCityEvent(SaveCityEvent event, Emitter emit) async {
    await _repository.writeSelectedCity(event.cityEntity);
    add(const LoadSelectedCityEvent());
  }
}
