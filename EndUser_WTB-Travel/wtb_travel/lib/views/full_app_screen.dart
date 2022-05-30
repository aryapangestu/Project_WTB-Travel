import 'package:flutter/material.dart';
import 'package:wtb_travel/views/home_screen.dart';
import 'package:wtb_travel/views/review_screen.dart';
import 'package:wtb_travel/views/category_screen.dart';
import 'package:wtb_travel/views/profile_screen.dart';

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
    const WtbTravelReviewScreen(),
    DrawerScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerScreen(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Review',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
