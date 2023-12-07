import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_practice/Practice/Features/Weather/Domain/api_error_model.dart';
import 'package:riverpod_practice/Practice/Features/Weather/Domain/weather_model.dart';

//

class WeatherRepository {
  final String key = "09c32d9641344bababf91956230612";
  final client = http.Client();
  final apiUrl = "https://api.weatherapi.com/v1/";
  //Constructor: mathi member ko value final nai xa, so pass garna pardaina
  WeatherRepository();

  //current bhanne endpoint bata json data leko le current.js lekheko
  Future<WeatherModel> currentWeather({required String query}) async {
    try {
      final response = await client
          .get(Uri.parse("${apiUrl}current.json?key=$key&q=$query"));

      if (response.statusCode == 200) {
        //success
        //weather model ko instance banaunu paryo
        //response.body ma encoded jsonString auxa, ani yo named parameter le chai encoded ho ki haina check garxa. haina vane gardinxa
        final currentWeather = WeatherModel.fromRawJson(response.body);
        return currentWeather;
      } else {
        //handles errors
        //api error model ko instance banaunu paryo
        final apiError = ApiErrorModel.fromRawJson(response.body);
        //throw le: yeta throw garesi, tyo kura, tala ko catche le handle gardinxa
        throw apiError.error.message;
      }
    }
    // on SocketException {
    //   //In case of connection loss: yesle handle garxa
    // } on TimeoutException {
    //   //In case of time out, tokeko time vitra fetch garna sakena vane
    // }
    catch (e) {
      //error handling ko kam
      //e, s parameters are: e = error object[error type, kina error ayo ta vanxa], s = stack trace[kun thau ma kun line ma, kata origin kata vayo]
      //e is req parameter, s is optional

      //first yeta try catch garxa, ajhai handle garna sakena vane chai,
      //rethrow le chai, yo method jata use hunxa, tya ko catch le handle gardinxa
      rethrow;
    }
    // finally {
    //   //try or catch ma vitra gayeni nagayeni, finally wala section run hunxa!!!
    //   throw "";
    // }
  }
}
