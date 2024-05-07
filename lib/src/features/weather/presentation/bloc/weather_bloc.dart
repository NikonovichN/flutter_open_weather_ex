import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api.dart';
import '../../domain/data/weather_repository.dart';
import '../../domain/entity/weather.dart';

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

    if (event.queryParams case final WeatherQueryParams params) {
      final weatherResponse = await _weatherRepository.fetchWeatherData(params);

      emit(
        weatherResponse.fold(
          (_) => const WeatherError(),
          (List<WeatherDetailsEntity> weather) => WeatherLoaded(
            todayWeather: weather[0].toState(),
            nextDaysWeather: weather
                .map((e) => e.toState())
                .where(
                  (e) => e.date.isAfter(DateTime.now()),
                )
                .toList(),
          ),
        ),
      );
    } else {
      emit(const WeatherInitial());
    }
  }
}

extension on WeatherDetailsEntity {
  WeatherDetailsState toState() => WeatherDetailsState(
        date: date,
        temp: '${main.temp.ceil().toString()} °C',
        tempFeelsLike: '${main.tempFeelsLike.ceil().toString()} °C',
        status: status[0].main,
        description: status[0].description,
        icon: status[0].icon,
      );
}
