import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:weather_app/data/city_repository.dart';
import 'package:weather_app/data/model/city.dart';

class CitySearchBloc {
  StreamController<List<City>> _streamController = BehaviorSubject();
  CityRepository _repository = CityRepository();
  List<City> _cities = <City>[];

  get stream => _streamController.stream;

  fetchCities(String query) async {
    _cities = await _repository.fetchCities(query);
    _streamController.sink.add(_cities);
  }

  saveCity(City city) {
    _repository.saveCityLocally(city);
  }

  dispose() {
    _streamController.close();
  }
}
