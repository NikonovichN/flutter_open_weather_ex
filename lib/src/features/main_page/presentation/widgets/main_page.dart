import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_open_weather_ex/src/di/injections.dart';

import '../../../features.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: const _MainPageContent(),
      )),
    );
  }
}

class _MainPageContent extends StatelessWidget {
  static const _emptySpaceL = SizedBox(height: 20.0);

  const _MainPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        return BlocListener<CitiesBloc, CitiesState>(
          listener: (context, state) {
            if (state is CitiesLoaded && state.selectedCity != null) {
              context.read<WeatherBloc>().add(
                    UpdateWeatherDataByCityEvent(
                      queryParams: WeatherQueryParams(
                        lat: state.selectedCity!.coordinates.latitude.toString(),
                        lon: state.selectedCity!.coordinates.longitude.toString(),
                        units: UnitMetrics.metric.name,
                        appid: injector<WeatherAPI>().getSecretKey,
                      ),
                    ),
                  );
            }
          },
          child: Center(
            child: switch (state) {
              MainPageInitial() => const CircularProgressIndicator(),
              MainPageLoading() => const CircularProgressIndicator(),
              MainPageLoaded() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _emptySpaceL,
                    Text(AppStrings.of(context)!.loadedMainPage),
                    _emptySpaceL,
                    const CitiesWidget(),
                    _emptySpaceL,
                    const Flexible(child: WeatherWidget()),
                  ],
                ),
              MainPageError() => const Text('Something went wrong...'),
            },
          ),
        );
      },
    );
  }
}
