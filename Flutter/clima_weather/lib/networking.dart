import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  String urlLink;
  NetworkHelper(this.urlLink);

  Future getData() async {
    //add future

    print(urlLink);
    Response response = await get(Uri.parse(urlLink));
    // print(response);
    if (response.statusCode == 200) {
      String data = await response.body;
      // print(data);
      return jsonDecode(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
