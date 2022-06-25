import 'package:flutter/material.dart';
import 'package:wtb_travel/models/user.dart';
import 'package:wtb_travel/views/home_screen.dart';
import 'package:wtb_travel/views/profile_screen.dart';
import 'package:nb_utils/nb_utils.dart';

class WtbTravelFullAppScreen extends StatefulWidget {
  const WtbTravelFullAppScreen(
      {Key? key, required this.title, required this.token, required this.user})
      : super(key: key);

  final String title, token;
  final profilUser user;

  @override
  State<WtbTravelFullAppScreen> createState() => _WtbTravelFullAppScreen();
}

class _WtbTravelFullAppScreen extends State<WtbTravelFullAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f0e4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff6f0e4),
        iconTheme: const IconThemeData(color: Color(0xffc7b899)),
        title: Text(
          widget.title,
          style: boldTextStyle(size: 20, color: const Color(0xff543c0d)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      drawer: DrawerScreen(
        token: widget.token,
        user: widget.user,
      ),
      body: Center(
        child: WtbTravelHomeScreen(
          token: widget.token,
          user: widget.user,
        ),
      ),
    );
  }
}
