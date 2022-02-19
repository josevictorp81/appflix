import 'package:appflix/pages/home.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _pageOptions = [];
    return Scaffold(
      backgroundColor: const Color(0xff111820),
      appBar: AppBar(
        backgroundColor: const Color(0xff111820),
        title: Text('App'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Home(),
          ),
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: _selectedIndex,
        backgroundColor: const Color(0xff111820),
        dotIndicatorColor: const Color(0xff111820),
        unselectedItemColor: Colors.grey,
        enableFloatingNavBar: false,
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home_outlined),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.search_outlined),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
