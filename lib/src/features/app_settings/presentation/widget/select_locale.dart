import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/app_settings_bloc.dart';
import '../../domain/entity/locale.dart';

class SelectLocaleWidget extends StatelessWidget {
  static const _emptySpaceWL = SizedBox(width: 20.0);

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
          AppSettingsError() => const Text('Something went wrong!'),
          AppSettingsLoaded() => Row(
              children: [
                Text(strings!.appSettingsLanguage),
                _emptySpaceWL,
                DropdownButton<LocaleEntity>(
                  enableFeedback: true,
                  value: state.localeEntity,
                  underline: const SizedBox.shrink(),
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.amber,
                  ),
                  style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
                  onChanged: (value) => context
                      .read<AppSettingsBloc>()
                      .add(WriteLocaleAppSettingsEvent(locale: value!)),
                  items: locales.map<DropdownMenuItem<LocaleEntity>>((value) {
                    return DropdownMenuItem<LocaleEntity>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
        };
      },
    );
  }
}
