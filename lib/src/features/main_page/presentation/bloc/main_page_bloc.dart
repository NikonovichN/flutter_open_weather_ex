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
    final listener = rx.CombineLatestStream.combine2<CitiesState, WeatherState, MainPageState>(
      _citiesBloc.stream,
      _weatherBloc.stream,
      (citiesState, weatherState) {
        return switch (citiesState) {
          CitiesInitial() => MainPageLoading(),
          CitiesLoading() => MainPageLoading(),
          CitiesError() => MainPageError(),
          CitiesLoaded() => citiesState.selectedCity != null
              ? switch (weatherState) {
                  WeatherInitial() => MainPageLoading(),
                  WeatherLoading() => MainPageLoading(),
                  WeatherLoaded() => MainPageLoaded(),
                  WeatherError() => MainPageError(),
                }
              : MainPageLoaded()
        };
      },
    );

    await emit.forEach(listener, onData: (data) => data);
  }
}
