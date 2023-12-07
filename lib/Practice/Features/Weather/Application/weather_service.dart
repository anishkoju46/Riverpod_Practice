import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Weather/Data/weather_repository.dart';
import 'package:riverpod_practice/Practice/Features/Weather/Domain/weather_model.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService(ref);
});

class WeatherService {
  final Ref ref;

  WeatherService(this.ref);

  final queryTextProvider = Provider<TextEditingController>((ref) {
    return TextEditingController(text: "kathmandu");
  });

  //Update garna naparne just view matra garaune lai we use FutureProvider
  late final currentWeatherFutureProvider = FutureProvider<WeatherModel>((ref) {
    //await garyo vane Future ko datatype return hunxa.
    //garena vane Future return hunxa.
    return WeatherRepository()
        .currentWeather(query: ref.read(queryTextProvider).text);
  });

  refereshCurrentWeather() {
    ref.refresh(currentWeatherFutureProvider);
  }
}
