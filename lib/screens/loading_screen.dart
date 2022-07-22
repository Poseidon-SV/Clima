import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

/// Async and Await
/// Ask permission add in AndroidMainfest.xml of Android
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
/// For IOS
// <key>NSLocationWhenInUseUsageDescription</key>
// <string>This app needs access to location when open.</string>
// <key>NSLocationAlwaysUsageDescription</key> FOR BACKGROUND RUN
// <string>This app needs access to location when in the background.</string>
/// Scaffold lifeCycle(There are 3 and more type of LifeCycle Which can be called as soon as that @overrride is callec)
// So our lifecycle method are really useful if we want to tap in
// to a particular moment in the life of our stateful widgets. If we wanted to save a piece of data just
// before the stateful widget gets destroyed or if we want to deallocate something from memory or if we
// want to create a new object as soon as the stateful widget gets initialized, these are the methods that
// we can tap into to make our code run at a particular time.
// @override
// void initState(){
// super.initState();
// print('initState Called')
// }

// @override
// void deactivate() {
//   super.deactivate();
//   print('deactivate called');
// }

// @override
// Widget build(BuildContext context) {
//  print('Build Called');
//  return Scaffold(Bla Bla Bla...Cuz it is Scaffold widget);
// }
// Now it's important to know that initState only gets called once and it's only the moment when that
// state gets initialized and gets created.
// But something like build even though it does get called when our widget gets built onto the screen, but
// it gets caught every single time that our widgets rebuild.
// So every time a piece of text changes or an image changes or this animation, then build will be called again
// and again and again. And very often you don't want to put code in there that will get called repeatedly
// because it's very expensive.
// Instead we're going to put it inside initState.
// And so inside initState, we're going to call get location.

/// double.parse(name_of_string_to_double_for_conversion)
/// Null aware operator '??' (someVariable ?? defaultValue)
/// APIs here used OpenWeatherMap API and generating own API-key (Just ask the
///   data you want and you'll get the information in JSON or some format and then read and display it in your way)
///
/// Navigator.push(to change the page)
/// Loading Screen Flutter_SpinKit(SpinningLines)
/// Passing Data to a State Object

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // late double latitude;
  // late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData(); // Hot restart
    // getdata(); //Needed to use frequently
  }

  void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather(); //getLocationWeather() returns Future

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      // To navigate to various pages
      return LocationScreen(
        locationWeather: weatherData, ///Passing Data to a State Object
      );
    }));

    // print(
    //     'temprature: $temprature, conditionNum: $conditionNum, cityName: $cityName');
    // print([temprature, conditionNum, cityName]);
  }

  @override
  Widget build(BuildContext context) {
    // getLocation(); Now you Know why not here

    return Scaffold(
        body: Center(
            child: SpinKitSpinningLines(
      color: Colors.white,
      size: 70,
    )));
  }
}
