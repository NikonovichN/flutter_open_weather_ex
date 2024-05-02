import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_open_weather_ex/src/features/weather/domain/entity/weather.dart';

import '../../api.dart';
import '../../domain/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(const WeatherInitial()) {
    on<UpdateWeatherDataByCityEvent>(_loadWeatherDataEvent);
  }

  Future<void> _loadWeatherDataEvent(UpdateWeatherDataByCityEvent event, Emitter emit) async {
    emit(const WeatherLoading());

    final weatherStream = _weatherRepository.fetchWeatherData(event.queryParams);

    await emit.forEach(
      weatherStream,
      onData: (List<WeatherDetails> weather) {
        return WeatherLoaded(
          todayWeather: weather[0],
          nextDaysWeather: weather.sublist(1),
        );
      },
      onError: (error, _) => const WeatherError(),
    );
  }
}
