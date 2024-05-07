import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as intl;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_open_weather_ex/src/ui_kit/ui_kit.dart';

import '../../weather.dart';

class Today extends StatelessWidget {
  static const _containerPadding = EdgeInsets.all(16);
  static const _maxWidthContainer = 300.0;
  static const _emptySpaceL = SizedBox(height: 16);
  static const _emptySpaceWM = SizedBox(width: 12);

  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    final locale = AppStrings.of(context)?.localeName;

    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, cur) => cur is WeatherLoaded,
      builder: (context, state) {
        state as WeatherLoaded;
        final day = state.todayWeather;
        final weekDay = intl.DateFormat.EEEE(locale).format(day.date).toUpperCase();

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
                        weekDay,
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
                    strings!.weatherFeelsLike(day.tempFeelsLike),
                    style: KitTextStyles.p4.copyWith(color: KitColors.onSecondary),
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
