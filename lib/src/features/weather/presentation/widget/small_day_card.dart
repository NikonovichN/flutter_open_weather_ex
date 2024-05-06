import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:flutter_open_weather_ex/src/ui_kit/ui_kit.dart';

import '../../helpers.dart';
import '../bloc/weather_bloc.dart';

class SmallDayCard extends StatelessWidget {
  final WeatherDetailsState weatherData;

  const SmallDayCard({super.key, required this.weatherData});

  static const _paddingContainer = EdgeInsets.all(8);
  static const _emptySpaceXXM = SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _paddingContainer,
      decoration: BoxDecoration(
        color: KitColors.background.withAlpha(120),
        border: Border.all(color: KitColors.onPrimary.withAlpha(160)),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: DefaultTextStyle(
        style: KitTextStyles.p4.copyWith(color: KitColors.onSecondary),
        child: Column(children: [
          Text(WeatherDay.values[weatherData.date.weekday - 1].name.toUpperCase()),
          _emptySpaceXXM,
          Text(weatherData.temp),
          _emptySpaceXXM,
          Image(
            width: 50,
            image: AssetImage('assets/icons/weather/${weatherData.icon}.png'),
          ),
          _emptySpaceXXM,
          Text(weatherData.status),
          _emptySpaceXXM,
          Text(DateFormat("HH:mm").format(weatherData.date))
        ]),
      ),
    );
  }
}
