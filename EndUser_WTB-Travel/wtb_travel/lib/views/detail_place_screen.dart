// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';

class SampleNavigationApp extends StatefulWidget {
  const SampleNavigationApp({Key? key}) : super(key: key);

  @override
  State<SampleNavigationApp> createState() => _SampleNavigationAppState();
}

class _SampleNavigationAppState extends State<SampleNavigationApp> {
  late MapBoxNavigation _directions;
  late MapBoxOptions _options;

  final bool _isMultipleStop = false;
  double? _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController? _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _directions = MapBoxNavigation(onRouteEvent: _onRouteEvent);
  }

  @override
  Widget build(BuildContext context) {
    _options = MapBoxOptions(
        initialLatitude: 36.1175275,
        initialLongitude: -115.1839524,
        zoom: 13.0,
        tilt: 0.0,
        bearing: 0.0,
        enableRefresh: false,
        alternatives: true,
        voiceInstructionsEnabled: true,
        bannerInstructionsEnabled: true,
        allowsUTurnAtWayPoints: true,
        mode: MapBoxNavigationMode.drivingWithTraffic,
        mapStyleUrlDay: "https://url_to_day_style",
        mapStyleUrlNight: "https://url_to_night_style",
        units: VoiceUnits.imperial,
        simulateRoute: true,
        language: "en");
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Second Route')),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () async {
            final cityHall = WayPoint(
                name: "City Hall", latitude: 42.886448, longitude: -78.878372);
            final downtown = WayPoint(
                name: "Downtown Buffalo",
                latitude: 42.8866177,
                longitude: -78.8814924);

            var wayPoints = <WayPoint>[];
            wayPoints.add(cityHall);
            wayPoints.add(downtown);

            await _directions.startNavigation(
                wayPoints: wayPoints, options: _options);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }

  Future<void> _onRouteEvent(e) async {
    _distanceRemaining = await _directions.distanceRemaining;
    _durationRemaining = await _directions.durationRemaining;

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {}
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        _routeBuilt = true;
        break;
      case MapBoxEvent.route_build_failed:
        _routeBuilt = false;
        break;
      case MapBoxEvent.navigation_running:
        _isNavigating = true;
        break;
      case MapBoxEvent.on_arrival:
        if (!_isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        _routeBuilt = false;
        _isNavigating = false;
        break;
      default:
        break;
    }
    //refresh UI
    setState(() {});
  }
}
