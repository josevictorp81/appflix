import 'package:appflix/utils/list_genres.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int length = args.overview.length;

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: const Color(0xff111820),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    height: height * .5,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 15),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                child: SizedBox(
                  width: width,
                  height: length > 965 ? height * 0.7 : height * .5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        args.overview,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        children: [
                          Text(
                            'Gênero: ',
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                          Text(
                            '${Genres().names(args.genreIds)}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        children: [
                          Text(
                            'Média de votos: ',
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                          Text(
                            '${args.voteAverage}',
                            style: const TextStyle(color: Colors.white),
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
