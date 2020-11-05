import 'package:flutter/material.dart';
import 'package:weather_app/bloc/city_search_bloc.dart';
import 'package:weather_app/data/model/city.dart';

class CitySearchDelegate extends SearchDelegate {
  final CitySearchBloc _bloc = CitySearchBloc();
  var _cities = <City>[];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
        itemCount: _cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_cities[index].name),
            onTap: () {
              _bloc.saveCity(_cities[index]);
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 300), () {
        _bloc.fetchCities(query);
      });
    }
    return StreamBuilder<List<City>>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var cities = snapshot.data;
            _cities = cities;
            return ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cities[index].name),
                    onTap: () {
                      _bloc.saveCity(cities[index]);
                      Navigator.pop(context);
                    },
                  );
                });
          } else {
            return Center(child: Text('No city found'));
          }
        });
  }
}
