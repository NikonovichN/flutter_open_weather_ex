import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cities_bloc.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (context, state) {
        return switch (state) {
          CitiesInitial() => const SizedBox.shrink(),
          CitiesLoading() => const CircularProgressIndicator(),
          CitiesLoaded(cities: var cities, selectedCity: var selectedCity) =>
            const SizedBox.shrink(),
          CitiesError() => const SizedBox.shrink(),
        };
      },
    );
  }
}
