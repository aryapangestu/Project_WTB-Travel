import 'package:flutter/material.dart';
import 'package:wtb_travel/views/home_screen.dart';
import 'package:wtb_travel/views/review_screen.dart';
import 'package:wtb_travel/views/category_screen.dart';
import 'package:wtb_travel/views/profile_screen.dart';
import 'package:nb_utils/nb_utils.dart';

class WtbTravelFullAppScreen extends StatefulWidget {
  const WtbTravelFullAppScreen({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<WtbTravelFullAppScreen> createState() => _WtbTravelFullAppScreen();
}

class _WtbTravelFullAppScreen extends State<WtbTravelFullAppScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const WtbTravelHomeScreen(),
    const WtbTravelCategoryScreen(),
    const WtbTravelReviewScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      drawer: const DrawerScreen(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Review',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
