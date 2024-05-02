import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(state.todayWeather.toString()),
                const SizedBox(height: 20.0),
                ...state.nextDaysWeather.map((e) => Text(e.toString()))
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
