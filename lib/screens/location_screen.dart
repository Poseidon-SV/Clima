import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

/// getting the data from the location screen object into the location screen's state object.
/// Passing Data to a State Object
/// Pushing TypedName Well that's going to be the output of our navigator.push method.
//
// So we can tap into it by creating a variable called typedName and we can set that to equal the output
// of navigated.push.
// So once the city screen gets pushed on top of the location screen, then the user types in the value for
// city name. And once the screen gets popped off, city name gets parsed back as the output of our typedName.

class LocationScreen extends StatefulWidget {
  LocationScreen(
      {this.locationWeather}); // Adding a property To take the info and put it here

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather =
      WeatherModel(); // To compare the weather conditionNum to weather

  late int temprature;
  late String weatherIcon;
  late String cityName;
  late String tempText;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);

    ///Passing Data to a State Object
  }

  void updateUI(dynamic weatherData) {
    // var temprature = jsonDecode(data)['main']['temp']; >>Memory
    // var conditionNum = jsonDecode(data)['weather'][0]['id'];
    // var cityName = decoData['name'];
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        weatherIcon = 'Error';
        tempText = 'Unable to fetch weather data';
        cityName = '';
        return; //And this tells our app that if the weather data is null, do all of these things but then exit this function or this
        //method. And you can use this return keyword in any of Dart's functions and methods, even if it returns void.
        // And what this does is it will end our method prematurely and prevent it from continuing on to the next
        // lines, which is what we know will crash our app.

      }

      double temp = weatherData['main']['temp'] - 273.15;

      temprature = temp.toInt();
      tempText = weather.getMessage(temprature);
      print('temprature: $temprature');

      var conditionNum = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(conditionNum);
      cityName = 'in ' + weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather
                          .getLocationWeather(); // Now get your current location weather data
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push( ///(Just watch-out for Future methods) To get the data after pop
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null ){ // Otherwise the normal pop can show error if null check was not there for a pop`
                       var weatherData = await weather.getCityWeather(typedName); /// Insert the information to get the City weather that is typed
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$tempText $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
