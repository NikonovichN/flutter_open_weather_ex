import 'package:flutter/material.dart';

import 'src/di/injections.dart';
import 'src/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await const DependencyInjections().registerDependencies();

  runApp(const WeatherApp());
}
