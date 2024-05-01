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
        BlocProvider<CitiesBloc>(
          create: (_) => injector<CitiesBloc>()..add(const LoadCitiesDataEvent()),
        ),
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
  const _MainPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        return Center(
          child: switch (state) {
            MainPageInitial() => const CircularProgressIndicator(),
            MainPageLoading() => const CircularProgressIndicator(),
            MainPageLoaded() => const Text('Loaded'),
            MainPageError() => const Text('Something went wrong...'),
          },
        );
      },
    );
  }
}
