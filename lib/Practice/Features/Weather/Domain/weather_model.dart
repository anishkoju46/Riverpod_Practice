import 'dart:convert';

import 'package:riverpod_practice/Practice/Features/Weather/Domain/current_model.dart';
import 'package:riverpod_practice/Practice/Features/Weather/Domain/location_model.dart';

class WeatherModel {
  final Location location;
  final Current current;

  const WeatherModel({
    required this.location,
    required this.current,
  });

  WeatherModel copyWith({
    Location? location,
    Current? current,
  }) =>
      WeatherModel(
        location: location ?? this.location,
        current: current ?? this.current,
      );

  factory WeatherModel.fromRawJson(String str) =>
      WeatherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
      };
}
