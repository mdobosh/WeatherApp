import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/model/city.dart';

class CityLocalSource {
  static final _key = "cities";

  Future<List<City>> getCities() async {
    var cityStrings =
        (await SharedPreferences.getInstance()).getStringList(_key);
    if (cityStrings != null) {
      return cityStrings.map((e) => City(e)).toList();
    } else {
      return <City>[];
    }
  }

  addCity(City city) async {
    var cities = await getCities();
    if (!cities.contains(city)) {
      cities.add(city);
      (await SharedPreferences.getInstance())
          .setStringList(_key, cities.map((e) => e.name).toList());
    }
  }
}
