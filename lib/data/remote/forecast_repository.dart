import 'package:weather_app/data/model/forecast.dart';
import 'package:weather_app/data/remote/forecast_api.dart';

class ForecastRepository {
  ForecastApi _api = ForecastApi();

  List<Forecast> fetchFakeData() {
    return [
      Forecast("Lviv", 15, 17, 20),
      Forecast("Kyiv", 15, 14, 20),
      Forecast("London", 10, 7, 12),
    ];
  }

  Future<Forecast> fetchForecast(String city) async {
    return await _api.fetchForecast(city);
  }
}
