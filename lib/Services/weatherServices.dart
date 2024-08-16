import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weatherModels.dart';

class weatherServices {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = '9a284600af864b21afe104141231008';

  Future<weatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityName&days=3');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weatherModel model = weatherModel.fromJson(data);
    return model;
  }
}
