import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart' as rx;

import '../../../cities/cities.dart';
import '../../../weather/weather.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CitiesBloc _citiesBloc;
  final WeatherBloc _weatherBloc;

  MainPageBloc({required CitiesBloc citiesBloc, required WeatherBloc weatherBloc})
      : _citiesBloc = citiesBloc,
        _weatherBloc = weatherBloc,
        super(MainPageInitial()) {
    on<ListenDependencies>(_listenDependencies);
  }

  Future<void> _listenDependencies(ListenDependencies event, Emitter emit) async {
    await rx.BehaviorSubject.seeded(_citiesBloc.stream).forEach((citiesState) async {
      await emit.onEach(
        citiesState,
        onData: (citiesData) => switch (citiesData) {
          CitiesInitial() => emit(MainPageLoading()),
          CitiesLoading() => emit(MainPageLoading()),
          CitiesLoaded() => citiesData.selectedCity != null
              ? rx.BehaviorSubject.seeded(_weatherBloc.stream).forEach((weatherState) async {
                  await emit.onEach(
                    weatherState,
                    onData: (weatherData) => switch (weatherData) {
                      WeatherInitial() => emit(MainPageLoading()),
                      WeatherLoading() => emit(MainPageLoading()),
                      WeatherLoaded() => emit(MainPageLoaded()),
                      WeatherError() => emit(MainPageError()),
                    },
                  );
                })
              : emit(MainPageLoaded()),
          CitiesError() => emit(MainPageError()),
        },
      );
    });
  }
}
