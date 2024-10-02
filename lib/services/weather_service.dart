
import 'package:app_weather/models/meteo.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  static double latitude = 41.358889;
  static double longitude = 2.099167;

  String url = "https://www.7timer.info/bin/civil.php?lon=$longitude&lat=$latitude&ac=0&unit=metric&output=json";

  Future<Meteo> fetchWeatherData() async {
    http.Response response = await http.get(Uri.parse(url));
    
    Meteo meteo = meteoFromJson(response.body);

    return meteo;
  }

}