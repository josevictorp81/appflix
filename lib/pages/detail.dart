import 'package:appflix/models/movie.dart';
import 'package:appflix/pages/home_page.dart';
import 'package:appflix/repository/movie_repository.dart';
import 'package:appflix/repository/resource.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Movie;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int length = args.overview.length;

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: const Color(0xff111820),
          width: width,
          // height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          'https://image.tmdb.org/t/p/w780/${args.posterPath}',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: SizedBox(
                  width: width,
                  height: length > 965 ? height * 0.7 : height * .5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        args.title,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        args.overview,
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        children: [
                          Text(
                            'Gênero: ',
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                          Text(
                            '${args.genreIds}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        children: [
                          Text(
                            'Média de votos: ',
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                          Text(
                            '${args.voteAverage}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
