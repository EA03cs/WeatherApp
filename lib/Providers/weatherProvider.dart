import 'package:flutter/cupertino.dart';
import 'package:weather_app/Models/weatherModels.dart';

class weatherProvider extends ChangeNotifier{
  weatherModel? _weatherData;
  set weatherData(weatherModel? weather)
  {
    _weatherData =weather;
    notifyListeners();
  }
weatherModel? get weatherData =>_weatherData;

}

