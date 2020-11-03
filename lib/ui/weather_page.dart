import 'package:flutter/material.dart';
import 'package:weather_app/data/model/forecast.dart';
import 'package:weather_app/data/remote/forecast_repository.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<Forecast> _forecasts;
  ForecastRepository _repository;

  @override
  void initState() {
    _repository = ForecastRepository();
    _forecasts = _repository.fetchFakeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: _forecasts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                      children:
                          _populateListItemWithForecast(_forecasts[index])),
                );
              })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _populateListItemWithForecast(Forecast forecast) {
    return [
      _getItemPartWidget(forecast.city.name),
      _getItemPartWidget('${forecast.temperatureToday}°C'),
      _getItemPartWidget('${forecast.temperatureTomorrow}°C'),
      _getItemPartWidget('${forecast.temperatureInTwoDays}°C'),
    ];
  }

  Widget _getItemPartWidget(String title) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(title),
      ),
    );
  }
}
