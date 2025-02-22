import 'package:mobile/services/networking.dart';
import '../services/location.dart';

const apiKey = 'b417688ee089cffa301759fd89da06e7';
const linkUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double? longitude;
  double? latitude;

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    // use to have the coordination
    await location.determinePosition();

    longitude = location.longtitude;
    latitude = location.latitude;

    //base on the xy, fetch the data
    Networking network = Networking(
        '$linkUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    //use a variable to transfer to another screen
    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
