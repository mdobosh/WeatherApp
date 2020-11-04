import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/model/forecast.dart';

class ForecastApi {
  String _baseUrl = "http://api.weatherapi.com/v1";
  String _apiKey = "22d45f3bc374476d91481121200411";

  Future<Forecast> fetchForecast(String city) async {
    final response =
        await http.get("$_baseUrl/forecast.json?key=$_apiKey&q=$city&days=3");
    if (response.statusCode == 200) {
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load forecast');
    }
  }
}
