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
    print("EKKK");
    print(widget.element.lat!);
    return GoogleMapsWidget(
      apiKey: "AIzaSyA-eP8XoOktXEmVllh4Sr-114P6l4ki5Ic",
      sourceLatLng: const LatLng(-6.9344694, 107.6049539),
      destinationLatLng: LatLng(widget.element.lng!, widget.element.lat!),
      routeWidth: 2,
    );
  }
}
