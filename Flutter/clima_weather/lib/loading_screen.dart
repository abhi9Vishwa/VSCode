// ignore_for_file: deprecated_member_use

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  var urlLink;

  void getLocation() async {
    Location location = Location();
    await location.getCurrentPosition();
    longitude = location.longitude;
    latitude = location.latitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=c89bfed4f0a1fa6e68b321429c046325');
    
    var weatherData = await networkHelper.getData();

    print(weatherData);

    // print(response.body);
    // var weatherID = jsonDecode(response.body)['weather'][0]['id'];
    // var tempValue = jsonDecode(response.body)['main']['temp'];
    // var locationName = jsonDecode(response.body)['name'];

    // print('$weatherID $tempValue $locationName');

    // print(latitude);
    // print(longitude);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
