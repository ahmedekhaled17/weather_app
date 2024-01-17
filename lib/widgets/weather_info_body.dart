import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
 final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.decoration),
            getThemeColor(weatherModel.decoration)[300]!,
            getThemeColor(weatherModel.decoration)[50]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherModel.cityName,
        //BlocProvider.of<GetWeatherCubit>(context).weatherModel.cityName,
        style:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
      ),

            Text('Updated at : ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style:const TextStyle(
                  fontSize: 18
              ),
            ),
            const SizedBox(
              height:32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                   "https:${weatherModel.image}"),
                 Text (weatherModel.temp.toString(),
                style:const TextStyle(
                fontWeight: FontWeight.bold,
                    fontSize: 30),
                    ),
                Column(
                  children:[
                    Text('Maxtemp: ${weatherModel.maxTemp.round()}',
                      style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text('Mintemp: ${weatherModel.minTemp.round()}',
                      style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                   const SizedBox(
                      height: 32,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(weatherModel.decoration,
             style:const TextStyle(
                 fontSize: 30,
                 fontWeight: FontWeight.bold
             ),
           ),
          ],
        ),
      ),
    );
  }
}
