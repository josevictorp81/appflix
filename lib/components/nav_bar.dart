import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.pathName, required this.text})
      : super(key: key);

  final String pathName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(pathName);
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
