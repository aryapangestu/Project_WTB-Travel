import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class WtbTravelDetailPlace extends StatefulWidget {
  const WtbTravelDetailPlace({Key? key}) : super(key: key);

  @override
  State<WtbTravelDetailPlace> createState() => _WtbTravelDetailPlace();
}

class _WtbTravelDetailPlace extends State<WtbTravelDetailPlace> {
  MapboxMapController? mapController;
  var isLight = true;

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            child: Icon(Icons.swap_horiz),
            onPressed: () => setState(
              () => isLight = !isLight,
            ),
          ),
        ),
        body: MapboxMap(
          styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
          accessToken:
              'sk.eyJ1IjoiYXJ5YXAyIiwiYSI6ImNsM3dkbXpvaTIwcnEzY2x0YXkwejI5M2YifQ.6KMv_aY1QEoTGcs2MeKcPA',
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)),
          onStyleLoadedCallback: _onStyleLoadedCallback,
        ));
  }
}
