import 'package:weather_app/data/model/city.dart';

class CityResponse {
  List<City> data;

  CityResponse.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List<dynamic>)
            .map((e) => City(e['name']))
            .toList();
}
