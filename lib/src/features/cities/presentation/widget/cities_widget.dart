import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cities_bloc.dart';
import '../../domain/entity/cities.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (context, state) {
        return switch (state) {
          CitiesInitial() => const CircularProgressIndicator(),
          CitiesLoading() => const CircularProgressIndicator(),
          CitiesLoaded() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<CityEntity>(
                    enableFeedback: true,
                    value: state.selectedCity,
                    underline: const SizedBox.shrink(),
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.amber,
                    ),
                    style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
                    onChanged: (value) =>
                        context.read<CitiesBloc>().add(SaveCityEvent(cityEntity: value!)),
                    items: state.cities.map<DropdownMenuItem<CityEntity>>((value) {
                      return DropdownMenuItem<CityEntity>(
                        value: value,
                        child: Text(
                          value.name,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                  if (state.selectedCity?.name case final String city)
                    Text(
                      city,
                      style: const TextStyle(color: Colors.black),
                    ),
                ],
              ),
            ),
          CitiesError() => const SizedBox.shrink(),
        };
      },
    );
  }
}
