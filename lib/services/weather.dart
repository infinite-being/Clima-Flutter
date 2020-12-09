import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "47f8adf2c827a2ac855cc66d2c93488a";
const openWeatherURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future getCityWeather(var CityName) async {
    var url = "$openWeatherURL?q=$CityName&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    return await networkHelper.getData();
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
