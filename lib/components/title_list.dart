import 'package:flutter/material.dart';

class TitleList extends StatelessWidget {
  const TitleList(
      {Key? key, required this.width, required this.text, this.top = 5})
      : super(key: key);

  final double width;
  final String text;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * .1, bottom: 10, top: top),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }
}
