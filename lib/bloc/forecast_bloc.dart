import 'dart:async';

import 'package:weather_app/data/model/forecast.dart';
import 'package:weather_app/data/remote/forecast_repository.dart';

class ForecastBloc {
  StreamController _streamController = StreamController<List<Forecast>>();
  ForecastRepository _repository = ForecastRepository();
  List<Forecast> _forecasts = <Forecast>[];

  get stream => _streamController.stream;

  ForecastBloc() {
    fetchWeather(["Lviv", "London", "New York"]);
  }

  fetchWeather(List<String> cities) async {
    for (var city in cities) {
      Forecast forecast = await _repository.fetchForecast(city);
      _forecasts.add(forecast);
      _streamController.sink.add(_forecasts);
    }
  }

  dispose() {
    _streamController.close();
  }
}
