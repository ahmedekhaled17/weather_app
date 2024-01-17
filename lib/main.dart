import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp()
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:(context) => BlocBuilder<GetWeatherCubit,WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch:getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.decoration),
              ),
              debugShowCheckedModeBanner: false,
              home:const HomeView(),
            );
          }
        ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? decoration) {
  if(decoration==null){
    return Colors.blue;
  }

  switch (decoration?.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.teal;
    case 'patchy rain possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
      return Colors.lightBlue;
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'light freezing rain':
    case 'light sleet':
    case 'patchy light snow':
    case 'light snow':
    case 'light rain shower':
    case 'light sleet showers':
    case 'light snow showers':
    case 'light showers of ice pellets':
    case 'patchy light rain with thunder':
    case 'patchy light snow with thunder':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'moderate or heavy freezing rain':
    case 'moderate or heavy sleet':
    case 'moderate or heavy snow':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'moderate or heavy sleet showers':
    case 'moderate or heavy snow showers':
    case 'moderate or heavy showers of ice pellets':
    case 'ice pellets':
    case 'moderate or heavy rain with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.blue;
    case 'blowing snow':
    case 'blizzard':
    default:
      return Colors.blue;
  }
}