import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_open_weather_ex/src/di/injections.dart';
import 'package:flutter_open_weather_ex/src/ui_kit/kit_color.dart';
import 'package:flutter_open_weather_ex/src/ui_kit/kit_text_styles.dart';

import '../../../features.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsBloc>(
          create: (_) => injector<AppSettingsBloc>()..add(const LoadAppSettingEvent()),
        ),
        BlocProvider<CitiesBloc>(
          create: (_) => injector<CitiesBloc>()..add(const LoadCitiesDataEvent()),
        ),
        BlocProvider<WeatherBloc>(create: (_) => injector<WeatherBloc>()),
        BlocProvider<MainPageBloc>(
          create: (BuildContext context) {
            return MainPageBloc(
              citiesBloc: context.read<CitiesBloc>(),
              weatherBloc: context.read<WeatherBloc>(),
            )..add(const ListenDependencies());
          },
        ),
      ],
      child: const _MainPage(),
    );
  }
}

class _MainPage extends StatelessWidget {
  const _MainPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LocaleSettings(),
              Flexible(child: _MainPageContent()),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocaleSettings extends StatelessWidget {
  const _LocaleSettings();

  @override
  Widget build(BuildContext context) {
    return const SelectLocaleWidget();
  }
}

class _MainPageContent extends StatelessWidget {
  static const _emptySpaceL = SizedBox(height: 20.0);
  static const _emptySpaceXL = SizedBox(height: 32.0);

  const _MainPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        final strings = AppStrings.of(context);
        return BlocListener<CitiesBloc, CitiesState>(
          listener: (context, state) {
            if (state is CitiesLoaded) {
              context.read<WeatherBloc>().add(
                    UpdateWeatherDataByCityEvent(
                      queryParams: state.selectedCity != null
                          ? WeatherQueryParams(
                              lat: state.selectedCity!.coordinates.latitude.toString(),
                              lon: state.selectedCity!.coordinates.longitude.toString(),
                              units: UnitMetrics.metric.name,
                              appid: injector<WeatherAPI>().getSecretKey,
                            )
                          : null,
                    ),
                  );
            }
          },
          child: switch (state) {
            MainPageInitial() => const Center(child: CircularProgressIndicator()),
            MainPageLoading() => const Center(child: CircularProgressIndicator()),
            MainPageError() => Text(strings!.errorSmthWrong),
            MainPageLoaded() => SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _emptySpaceXL,
                    Text(
                      strings!.mainPageLoaded,
                      style: KitTextStyles.p1.copyWith(color: KitColors.onPrimary.withAlpha(160)),
                    ),
                    _emptySpaceL,
                    const CitiesWidget(),
                    _emptySpaceXL,
                    const WeatherWidget(),
                    _emptySpaceXL
                  ],
                ),
              ),
          },
        );
      },
    );
  }
}
