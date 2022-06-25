import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:wtb_travel/models/place.dart';
import 'package:nb_utils/nb_utils.dart';

class MapNavigationApp extends StatefulWidget {
  final Place element;
  MapNavigationApp({Key? key, required this.element}) : super(key: key);

  @override
  State<MapNavigationApp> createState() => _MapNavigationAppState();
}

class _MapNavigationAppState extends State<MapNavigationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f0e4),
      body: Stack(
        children: [
          GoogleMapsWidget(
            apiKey: "AIzaSyA-eP8XoOktXEmVllh4Sr-114P6l4ki5Ic",
            sourceLatLng: LatLng(widget.element.lat!, widget.element.lng!),
            destinationLatLng: LatLng(widget.element.lat!, widget.element.lng!),
            routeWidth: 2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: radius(100)),
                        child: IconButton(
                          icon:
                              Icon(Icons.arrow_back, color: Color(0xffc7b899)),
                          onPressed: () {
                            finish(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingOnly(left: 16, top: 30, right: 16),
            ],
          ),
        ],
      ),
    );
  }
}
