import 'package:geolocator/geolocator.dart';

/// We can only 'await' on methods that return 'Future'
/// Geolocator for Location tracking API https://pub.dev/packages/geolocator
/// Try-Exception-Catch-Error-Throw (If user denied or we can't get the users location)

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // print(position);
      // print("one"); taking lot of time to execute
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
