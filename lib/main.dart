import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

/// screens/loading_screen.dart
    /// Async programing and Await , Futures
    /// Geolocator for Location tracking API https://pub.dev/packages/geolocator
    /// Ask permission from mobile to access mobile servivces
    /// Scaffold lifeCycle
    /// double.parse(name_of_string_to_double_for_conversion)
    /// Null aware operator '??' (someVariable ?? defaultValue)
    /// APIs (Weather)
    /// Navigator.push(to change the page)
    /// Loading Screen Flutter_SpinKit(SpinningLines)
    /// Passing Data to a State Object
/// package:dart.io (Extra)
  /// Duration name_of_duration = Duration(seconds/hour/milliseconds/etc. : 3);
  /// sleep(name_of_duration);
/// services/location.dart
    /// Try-Exception-Catch-Error-Throw (If user denied or we can't get the users location)
/// services/networking.dart
    /// APIs (Weather)
/// screen/location_screen
    /// Passing Data to a State Object
///services/weather.dart
    /// https API input-output
/// screen/city_screen.dart
    /// TextField
    /// Elevated Button
    /// Use TextField content as an Input
///
///
/// THE END 02-07-2022
/// For example instead of just getting the current weather for our location, what about getting some forecasted
// weather?
// What about adding more widgets to display more values on screen? And you can check out all the cool things
// that you can do with the Open Weather Map APIs such as getting an hourly forecast or some historical
// data or even things such as UV index and air pollution.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
