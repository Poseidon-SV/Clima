import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

/// https API input-output
/// https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=638fbdc61bfa99cc7a0e1ca36dc048e3&units=metric

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=638fbdc61bfa99cc7a0e1ca36dc048e3'; // Temp Will be changed in Celsius from Fahrenheit
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData(); ///getData() is asynchronous

    return weatherData;
}

  Future<dynamic> getLocationWeather() async {
    ///Mobile location display part
    Location location = Location();

    ///From location.dart file
    await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;
    // print(latitude);
    // print(longitude);
    // getdata(); // Now you know why (so we can not pass the empty)

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=638fbdc61bfa99cc7a0e1ca36dc048e3#');

    var weatherData = await networkHelper.getData();

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
      return 'It\'s 🍦 time, it\'s hot outside';
    } else if (temp > 20) {
      return 'Time for shorts and 👕, it\'s warm outside';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 it\'s cold outside';
    } else {
      return 'Bring a 🧥 just in case ';
    }
  }
}
