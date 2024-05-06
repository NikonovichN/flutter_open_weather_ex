import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_open_weather_ex/src/ui_kit/ui_kit.dart';

import '../bloc/app_settings_bloc.dart';
import '../../domain/entity/locale.dart';

class SelectLocaleWidget extends StatelessWidget {
  static const _emptySpaceWL = SizedBox(width: 20.0);
  static const _padding = EdgeInsets.symmetric(horizontal: 40.0);

  const SelectLocaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        final supportedLocales =
            context.findAncestorWidgetOfExactType<MaterialApp>()?.supportedLocales ?? [];
        final locales = supportedLocales.map((e) => LocaleEntity(name: e.languageCode));
        final strings = AppStrings.of(context);

        return switch (state) {
          AppSettingsInitial() => const CircularProgressIndicator(),
          AppSettingsLoading() => const CircularProgressIndicator(),
          AppSettingsError() => Text(strings!.errorSmthWrong),
          AppSettingsLoaded() => Padding(
              padding: _padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    strings!.appSettingsLanguage,
                    style: KitTextStyles.p3.copyWith(color: KitColors.onPrimary),
                  ),
                  _emptySpaceWL,
                  DropdownButton<LocaleEntity>(
                    enableFeedback: true,
                    value: state.localeEntity,
                    icon: const Icon(Icons.arrow_drop_down_sharp, color: KitColors.onPrimary),
                    dropdownColor: KitColors.primary.withAlpha(120),
                    onChanged: (value) => context
                        .read<AppSettingsBloc>()
                        .add(WriteLocaleAppSettingsEvent(locale: value!)),
                    items: locales.map<DropdownMenuItem<LocaleEntity>>((value) {
                      return DropdownMenuItem<LocaleEntity>(
                        value: value,
                        child: Text(
                          value.name,
                          style: KitTextStyles.p3.copyWith(color: KitColors.onPrimary),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
        };
      },
    );
  }
}
