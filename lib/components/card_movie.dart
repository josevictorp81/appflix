import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({Key? key, required this.urlImage, required this.name})
      : super(key: key);

  final String urlImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140,
          height: 160,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(urlImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}
