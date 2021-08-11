import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Explore.dart';
import 'Saved.dart';
class DashBoardPage extends StatefulWidget {
  @override
  DashBoard createState() => DashBoard();
}

/// This is the private State class that goes with MyStatefulWidget.
class DashBoard extends State<DashBoardPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    SavedPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xffe46b10),
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Saved',
          ),
        ],

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}