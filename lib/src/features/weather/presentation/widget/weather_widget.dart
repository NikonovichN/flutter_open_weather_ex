import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/weather_bloc.dart';
import 'today_widget.dart';
import 'small_day_card.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  static const _emptySpaceXL = SizedBox(height: 32.0);
  static const _horizontalScrollHeight = 180.0;
  static const _horizontalScrollPadding = EdgeInsets.symmetric(horizontal: 10.0);
  static const _cardPadding = EdgeInsets.symmetric(horizontal: 10.0);

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
              _emptySpaceXL,
              SizedBox(
                height: _horizontalScrollHeight,
                child: ListView(
                  padding: _horizontalScrollPadding,
                  scrollDirection: Axis.horizontal,
                  children: state.nextDaysWeather
                      .map((e) => Padding(
                            padding: _cardPadding,
                            child: SmallDayCard(weatherData: e),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
      },
    );
  }
}
