import 'package:flutter/material.dart';
import 'package:wtb_travel/views/full_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WTB-Travel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WtbTravelFullAppScreen(title: 'WTB-Travel'),
    );
  }
}
