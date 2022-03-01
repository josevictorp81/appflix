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
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w780/$urlImage'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
