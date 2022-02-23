import 'package:appflix/pages/home.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Movies;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String text =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.';

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: const Color(0xff111820),
          width: width,
          height: height,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    height: height * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(
                          args.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                height: height * .5,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      args.name,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      text,
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'genero: drama, suspense',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
