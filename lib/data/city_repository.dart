import 'package:weather_app/data/local/city_local_source.dart';
import 'package:weather_app/data/model/city.dart';
import 'package:weather_app/data/remote/city_api.dart';

class CityRepository {
  factory CityRepository() => CityRepository._internal();

  CityApi _api;
  CityLocalSource _localSource;

  CityRepository._internal() {
    _api = CityApi();
    _localSource = CityLocalSource();
  }

  Future<List<City>> fetchCities(String query) async {
    return (await _api.fetchCities(query)).data;
  }

  Future<List<City>> getSavedCities() async {
    return await _localSource.getCities();
  }

  saveCityLocally(City city) {
    _localSource.addCity(city);
  }
}
