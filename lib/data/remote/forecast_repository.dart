import 'package:weather_app/data/model/city.dart';
import 'package:weather_app/data/model/forecast.dart';

class ForecastRepository {
  List<Forecast> fetchFakeData() {
    return [
      Forecast(City("Lviv", 50.0, 24.0), 15, 17, 20),
      Forecast(City("Kyiv", 50.0, 30.0), 15, 14, 20),
      Forecast(City("London", 51.0, 0.0), 10, 7, 12),
    ];
  }
}
