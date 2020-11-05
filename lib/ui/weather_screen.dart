import 'package:flutter/material.dart';
import 'package:weather_app/bloc/forecast_bloc.dart';
import 'package:weather_app/data/model/forecast.dart';
import 'package:weather_app/ui/city_search_delegate.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
                  itemCount: forecasts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ListTile(title: _getListHeader());
                    }
                    index--;
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
        onPressed: () {
          showSearch(context: context, delegate: CitySearchDelegate())
              .then((value) => setState(() => {_bloc.updateWeather()}));
        },
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

  Widget _getListHeader() {
    return Row(
      children: [
        _getItemPartWidgetBold('City'),
        _getItemPartWidgetBold('Today'),
        _getItemPartWidgetBold('Tomorrow'),
        _getItemPartWidgetBold('In 2 days'),
      ],
    );
  }

  Widget _getItemPartWidgetBold(String title) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
