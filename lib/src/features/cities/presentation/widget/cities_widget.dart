import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_open_weather_ex/src/ui_kit/ui_kit.dart';

import '../bloc/cities_bloc.dart';
import '../../domain/entity/cities.dart';

class CitiesWidget extends StatelessWidget {
  static const _paddingLeft = EdgeInsets.only(left: 40.0);
  static const _paddingRight = EdgeInsets.only(right: 40.0);
  static const _enLocale = 'en';

  const CitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppStrings.of(context)?.localeName;
    final strings = AppStrings.of(context);

    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (context, state) {
        return switch (state) {
          CitiesInitial() => const CircularProgressIndicator(),
          CitiesLoading() => const CircularProgressIndicator(),
          CitiesError() => Text(strings!.errorSmthWrong),
          CitiesLoaded() => Container(
              decoration: BoxDecoration(
                color: KitColors.primary.withAlpha(120),
                border: Border.all(color: KitColors.onPrimary.withAlpha(160)),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: DropdownButton<CityEntity>(
                enableFeedback: true,
                value: state.selectedCity,
                underline: const SizedBox.shrink(),
                icon: const Padding(
                  padding: _paddingRight,
                  child: Icon(Icons.arrow_drop_down_circle_outlined, color: KitColors.onPrimary),
                ),
                dropdownColor: KitColors.primary.withAlpha(160),
                onChanged: (value) =>
                    context.read<CitiesBloc>().add(SaveCityEvent(cityEntity: value!)),
                items: state.cities.map<DropdownMenuItem<CityEntity>>((value) {
                  return DropdownMenuItem<CityEntity>(
                    value: value,
                    child: Padding(
                      padding: _paddingLeft,
                      child: Text(
                        locale == _enLocale ? value.name : value.localizedName,
                        style: KitTextStyles.p1.copyWith(color: KitColors.onPrimary),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        };
      },
    );
  }
}
