class Forecast {
  Forecast(this.city, this.temperatureToday, this.temperatureTomorrow,
      this.temperatureInTwoDays);

  String city;
  double temperatureToday;
  double temperatureTomorrow;
  double temperatureInTwoDays;

  Forecast.fromJson(Map<String, dynamic> json)
      :
        city = json['location']['name'],
        temperatureToday = json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        temperatureTomorrow = json['forecast']['forecastday'][1]['day']['avgtemp_c'],
        temperatureInTwoDays = json['forecast']['forecastday'][2]['day']['avgtemp_c'];
}
