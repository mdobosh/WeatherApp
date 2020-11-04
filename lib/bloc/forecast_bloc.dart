import 'dart:async';

import 'package:weather_app/data/model/forecast.dart';
import 'package:weather_app/data/remote/forecast_repository.dart';

class ForecastBloc {
  StreamController _streamController = StreamController<Forecast>();
  ForecastRepository _repository = ForecastRepository();

  Stream<Forecast> get stream => _streamController.stream;

  ForecastBloc() {
    fetchWeather("Lviv");
  }

  fetchWeather(String city) async {
    Forecast forecast = await _repository.fetchForecast(city);
    _streamController.sink.add(forecast);
  }

  dispose() {
    _streamController.close();
  }
}
