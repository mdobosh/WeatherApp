import 'dart:async';

import 'package:weather_app/data/city_repository.dart';
import 'package:weather_app/data/forecast_repository.dart';
import 'package:weather_app/data/model/city.dart';
import 'package:weather_app/data/model/forecast.dart';

class ForecastBloc {
  StreamController _streamController = StreamController<List<Forecast>>();
  ForecastRepository _repository = ForecastRepository();
  CityRepository _cityRepository = CityRepository();
  List<Forecast> _forecasts = <Forecast>[];

  get stream => _streamController.stream;

  ForecastBloc() {
    initWeather();
  }

  updateWeather() {
    _forecasts.clear();
    _streamController.sink.add(_forecasts);
    initWeather();
  }

  initWeather() async {
    fetchWeather(await _cityRepository.getSavedCities());
  }

  fetchWeather(List<City> cities) async {
    for (var city in cities) {
      Forecast forecast = await _repository.fetchForecast(city.name);
      _forecasts.add(forecast);
      _streamController.sink.add(_forecasts);
    }
  }

  dispose() {
    _streamController.close();
  }
}
