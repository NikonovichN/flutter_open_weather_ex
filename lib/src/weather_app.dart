import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'di/injections.dart';
import 'features/features.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppSettingsBloc>(
      create: (context) => injector<AppSettingsBloc>()..add(const LoadAppSettingEvent()),
      child: const _WeatherApp(),
    );
  }
}

class _WeatherApp extends StatelessWidget {
  const _WeatherApp();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        Locale locale = const Locale('en');

        if (state is AppSettingsLoaded) {
          locale = Locale(state.localeEntity.name);
        }

        return MaterialApp(
          title: 'Weather App',
          localizationsDelegates: const [
            AppStrings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
          ],
          locale: locale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MainPage(),
        );
      },
    );
  }
}
