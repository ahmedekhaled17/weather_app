
import '../../model/weather_model.dart';

class WeatherStates{}
class WeatherInitialState extends WeatherStates{}
class WeatherLoadedStates extends WeatherStates{
   final WeatherModel weatherModel;

  WeatherLoadedStates(this.weatherModel);
}
class WeatherFailureStates extends WeatherStates{
  final String errMessage;

  WeatherFailureStates(this.errMessage);

}


// class CustomText extends StatelessWidget {
//   const CustomText({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       BlocProvider.of<GetWeatherCubit>(context).weatherModel.cityName,
//       style:const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 30
//       ),
//     );
//   }
// }