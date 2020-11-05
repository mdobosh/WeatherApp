import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/model/city_response.dart';

class CityApi {
  String _baseUrl = "https://rapidapi.p.rapidapi.com/v1/geo";

  Future<CityResponse> fetchCities(String query) async {
    var response =
        await http.get("$_baseUrl/cities?namePrefix=$query&limit=10", headers: {
      "x-rapidapi-key": "7649f84cddmshbda1f4a302270d8p128874jsn581cb7e1d928",
      "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
    });
    print(response.body);
    if (response.statusCode == 200) {
      return CityResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
