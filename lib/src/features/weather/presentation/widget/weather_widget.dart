import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/weather_bloc.dart';
import 'today_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) => switch (state) {
        WeatherInitial() => const Center(child: CircularProgressIndicator()),
        WeatherLoading() => const Center(child: CircularProgressIndicator()),
        WeatherError() => Text(strings!.errorSmthWrong),
        WeatherLoaded() => Column(
            children: [
              const Today(),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: state.nextDaysWeather.map((e) => Text(e.toString())).toList(),
                ),
              ),
            ],
          ),
      },
    );
  }
}
