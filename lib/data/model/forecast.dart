import 'city.dart';

class Forecast {
  Forecast(this.city, this.temperatureToday, this.temperatureTomorrow,
      this.temperatureInTwoDays);

  City city;
  int temperatureToday;
  int temperatureTomorrow;
  int temperatureInTwoDays;
}
