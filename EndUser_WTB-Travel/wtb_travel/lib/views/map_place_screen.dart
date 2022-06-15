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
    return GoogleMapsWidget(
      apiKey: "AIzaSyA-eP8XoOktXEmVllh4Sr-114P6l4ki5Ic",
      sourceLatLng: LatLng(40.484000837597925, -3.369978368282318),
      destinationLatLng: LatLng(40.48017307700204, -3.3618026599287987),

      ///////////////////////////////////////////////////////
      //////////////    OPTIONAL PARAMETERS    //////////////
      ///////////////////////////////////////////////////////

      routeWidth: 2,
      sourceMarkerIconInfo: MarkerIconInfo(
        assetPath: "https://picsum.photos/250?image=9",
      ),
      destinationMarkerIconInfo: MarkerIconInfo(
        assetPath: "https://picsum.photos/250?image=9",
      ),
      driverMarkerIconInfo: MarkerIconInfo(
        assetPath: "https://picsum.photos/250?image=9",
        assetMarkerSize: Size.square(125),
        rotation: 90,
      ),
      updatePolylinesOnDriverLocUpdate: true,
      // mock stream
      driverCoordinatesStream: Stream.periodic(
        Duration(milliseconds: 500),
        (i) => LatLng(
          40.47747872288886 + i / 10000,
          -3.368043154478073 - i / 10000,
        ),
      ),
      sourceName: "This is source name",
      driverName: "Alex",
      onTapDriverMarker: (currentLocation) {
        print("Driver is currently at $currentLocation");
      },
      totalTimeCallback: (time) => print(time),
      totalDistanceCallback: (distance) => print(distance),
    );
  }
}
