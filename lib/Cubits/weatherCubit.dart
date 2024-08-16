import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/weatherStates.dart';
import 'package:weather_app/Models/weatherModels.dart';

import '../Services/weatherServices.dart';

class weatherCubit extends Cubit<weatherStates> {
  weatherCubit(this.obj) : super(weatherInitialState());
  weatherServices obj;
  String ? cityName;
  weatherModel ? weatherData;
  void getWeather({required String cityName})async {
    emit(weatherLoadingState());
  weatherData = await obj.getWeather(cityName: cityName).then((value) {
      emit(weatherSuccessState());
    }).onError((error, stackTrace) {
      emit(weatherErrorState());
    });
  }

}