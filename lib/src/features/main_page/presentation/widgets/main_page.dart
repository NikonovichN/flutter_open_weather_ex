import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_open_weather_ex/src/di/injections.dart';

import '../../../features.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CitiesBloc>(create: (_) => injector<CitiesBloc>()),
        BlocProvider<WeatherBloc>(create: (_) => injector<WeatherBloc>()),
        BlocProvider<MainPageBloc>(
          create: (BuildContext context) {
            return MainPageBloc(
              citiesBloc: context.read<CitiesBloc>(),
            )..add(const ListenDependencies());
          },
        ),
      ],
      child: const Scaffold(body: _MainPageContent()),
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
        return Center(
          child: switch (state) {
            MainPageInitial() => const CircularProgressIndicator(),
            MainPageLoading() => const CircularProgressIndicator(),
            MainPageLoaded() => const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loaded'),
                  _emptySpaceL,
                  _CitiesListenerWrapper(),
                ],
              ),
            MainPageError() => const Text('Something went wrong...'),
          },
        );
      },
    );
  }
}

class _CitiesListenerWrapper extends StatelessWidget {
  const _CitiesListenerWrapper();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CitiesBloc, CitiesState>(
      listener: (context, state) {
        if (state is CitiesLoaded && state.selectedCity != null) {
          // TODO: move this logic to bloc
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
      child: const CitiesWidget(),
    );
  }
}
