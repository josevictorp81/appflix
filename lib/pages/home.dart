import 'package:appflix/pages/home_page.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xff111820),
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Home(),
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        margin: const EdgeInsets.only(left: 10, right: 10),
        currentIndex: _selectedIndex,
        backgroundColor: const Color(0xff111820),
        dotIndicatorColor: const Color(0xff111820),
        unselectedItemColor: Colors.grey,
        enableFloatingNavBar: false,
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.tv),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.message),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
