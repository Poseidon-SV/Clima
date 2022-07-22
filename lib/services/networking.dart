import 'package:http/http.dart'
    as http; // To make to visible that this method is from http package
import 'dart:convert'; // JsonDecoder

/// APIs here used OpenWeatherMap API and generating own API-key (Just ask the
///   data you want and you'll get the information in JSON or some format and then read and display it in your way)

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);

      // var lon = jsonDecode(data)['coord']['lon']; ///To get the information we needed (From Json format)
      // print(lon); //>>Example

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
