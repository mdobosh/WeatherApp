import 'package:flutter/material.dart';
import 'package:weather_app/bloc/forecast_bloc.dart';
import 'package:weather_app/data/model/forecast.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final ForecastBloc _bloc = ForecastBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<List<Forecast>>(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var forecasts = snapshot.data;
              return ListView.builder(
                  itemCount: forecasts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Row(
                      children: _populateListItemWithForecast(forecasts[index]),
                    ));
                  });
            } else {
              return Text("No data provided");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _populateListItemWithForecast(Forecast forecast) {
    return [
      _getItemPartWidget(forecast.city),
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

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
