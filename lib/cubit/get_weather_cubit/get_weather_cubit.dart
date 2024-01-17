
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';

import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit <WeatherStates>{
  GetWeatherCubit(): super (WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async{
  try {
     weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName :cityName );
    emit(WeatherLoadedStates(weatherModel!));
  } catch (e) {
    emit(WeatherFailureStates(e.toString()));
   }
  }
}