import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  LatLng? _center;
  Position? currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation!.latitude, currentLocation!.longitude);
    });
    print('waquar');
    print(currentLocation!.latitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
