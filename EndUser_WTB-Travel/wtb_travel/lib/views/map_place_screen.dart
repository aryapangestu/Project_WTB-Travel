import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:wtb_travel/models/place.dart';

class MapNavigationApp extends StatefulWidget {
  final Place element;
  MapNavigationApp({Key? key, required this.element}) : super(key: key);

  @override
  State<MapNavigationApp> createState() => _MapNavigationAppState();
}

class _MapNavigationAppState extends State<MapNavigationApp> {
  @override
  Widget build(BuildContext context) {
    return GoogleMapsWidget(
      apiKey: "AIzaSyA-eP8XoOktXEmVllh4Sr-114P6l4ki5Ic",
      sourceLatLng: LatLng(40.484000837597925, -3.369978368282318),
      destinationLatLng: LatLng(widget.element.lat!, widget.element.lng!),
      routeWidth: 2,
    );
  }
}
