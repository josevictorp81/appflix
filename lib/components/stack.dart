import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  const CustomStack(
      {Key? key,
      required this.urlImage,
      required this.name,
      required this.width,
      required this.height})
      : super(key: key);

  final String urlImage;
  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                urlImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(255, 255, 255, 0.2),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: width * .8,
          height: height * .3,
          margin: EdgeInsets.only(top: width * .4, left: width * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Studios XXX',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
