import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

class SampleNavigationApp extends StatefulWidget {
  const SampleNavigationApp({Key? key}) : super(key: key);

  @override
  State<SampleNavigationApp> createState() => _SampleNavigationAppState();
}

class _SampleNavigationAppState extends State<SampleNavigationApp> {
  @override
  Widget build(BuildContext context) {
    return const GoogleMapsWidget(
      apiKey: "AIzaSyA-eP8XoOktXEmVllh4Sr-114P6l4ki5Ic",
      sourceLatLng: LatLng(40.484000837597925, -3.369978368282318),
      destinationLatLng: LatLng(40.48017307700204, -3.3618026599287987),
      routeWidth: 2,
    );
  }
}
