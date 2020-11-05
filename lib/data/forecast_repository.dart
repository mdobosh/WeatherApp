import 'package:weather_app/data/model/forecast.dart';
import 'package:weather_app/data/remote/forecast_api.dart';

class ForecastRepository {
  ForecastApi _api = ForecastApi();

  Future<Forecast> fetchForecast(String city) async {
    return await _api.fetchForecast(city);
  }
}
