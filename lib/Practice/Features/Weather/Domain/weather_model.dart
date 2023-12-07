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

  //json ma encoded string ma auxa ani tyo datalai decode garney kam fromRawJsonle garxa.
  //string ako lai json.decode ma pass garxa. ako string decodeable json xa ki nai bhanera check garxa.
  //ho bhane Map ma change gardinxa hamro dartko casema.
  //haina bhane chai method ma error auxa decode garda.
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
