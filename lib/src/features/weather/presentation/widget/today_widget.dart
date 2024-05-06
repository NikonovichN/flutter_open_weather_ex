import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_open_weather_ex/src/ui_kit/ui_kit.dart';

import '../../../weather/helpers.dart';
import '../../weather.dart';

class Today extends StatelessWidget {
  static const _containerPadding = EdgeInsets.all(16);
  static const _maxWidthContainer = 300.0;
  static const _emptySpaceL = SizedBox(height: 16);
  static const _emptySpaceWM = SizedBox(width: 12);

  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, cur) => cur is WeatherLoaded,
      builder: (context, state) {
        state as WeatherLoaded;
        final day = state.todayWeather;

        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidthContainer),
          child: Container(
            padding: _containerPadding,
            decoration: BoxDecoration(
              color: KitColors.background.withAlpha(120),
              border: Border.all(color: KitColors.onPrimary.withAlpha(160)),
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Padding(
              padding: _containerPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        WeatherDay.values[day.date.weekday - 1].name.toUpperCase(),
                        style: KitTextStyles.p3.copyWith(color: KitColors.onSecondary),
                      ),
                      Text(
                        '${day.date.day}.${day.date.month}.${day.date.year}',
                        style: KitTextStyles.p3.copyWith(color: KitColors.onSecondary),
                      ),
                    ],
                  ),
                  _emptySpaceL,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day.temp,
                        style: KitTextStyles.p1.copyWith(color: KitColors.onPrimary, fontSize: 28),
                      ),
                      _emptySpaceWM,
                      Image(
                        width: 50,
                        image: AssetImage(
                          'assets/icons/weather/${day.icon}.png',
                        ),
                      ),
                    ],
                  ),
                  _emptySpaceL,
                  Text(
                    'Feels like: ${day.tempFeelsLike}',
                    style: KitTextStyles.p4.copyWith(color: KitColors.onSecondary),
                  ),
                  _emptySpaceL,
                  RichText(
                    text: TextSpan(
                      text: '${day.status}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: day.description,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
